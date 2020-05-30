import 'dart:io';

import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/redux/articles/articles_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class SetArticlesStateAction {
  final ArticlesState initialState;

  SetArticlesStateAction(this.initialState);
}

Future<void> getArticles({store}) async { 
  if(store.state.articlesState.isSuccess == true) return;
  try {
    store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: true, isError: false, isSuccess: false)));
    var articlesResponse = await http.get('https://afternoon-waters-37189.herokuapp.com/api/articles/');

    if(articlesResponse.statusCode == 200) {
        var articlesBody = await json.decode(articlesResponse.body);
        List<Article> articles = List();
        for (var item in articlesBody) {
          var newArticle = Article.fromJson(item);
          articles.add(newArticle);
        }
        return store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: false, isError: false, isSuccess: true, articles: articles)));
      } else {
        return store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    return store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: false, isError: err, isSuccess: false)));
  }
}

Future<void> getAdminArticles({store}) async { 
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: true, isError: false, isSuccess: false)));
    String token = prefs.getString('token');

    var articlesResponse = await http.get('https://afternoon-waters-37189.herokuapp.com/api/admin/articles/', headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

    if(articlesResponse.statusCode == 200) {
        var articlesBody = await json.decode(articlesResponse.body);
        List<Article> articles = articlesBody.map<Article>((article) => Article.fromJson(article)).toList();
        return store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: false, isError: false, isSuccess: true, articles: articles)));
      } else {
        return store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    return store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: false, isError: err, isSuccess: false)));
  }
}

Future<void> toggleActive({store, articleId, status}) async { 
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: true, isError: false, isSuccess: false)));
    String token = prefs.getString('token');

    var articlesResponse = await http.patch('https://afternoon-waters-37189.herokuapp.com/api/admin/articles/$articleId/status', 
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      body: {"status": status},
    );

    print(articlesResponse.statusCode);
    if(articlesResponse.statusCode == 200) {

        return store.dispatch(getAdminArticles(store: store));
    } else {
        return store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    return store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: false, isError: err, isSuccess: false)));
  }
}

Future<void> deleteArticle({store, articleId}) async { 
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: true, isError: false, isSuccess: false)));
    String token = prefs.getString('token');

    var articlesResponse = await http.delete('https://afternoon-waters-37189.herokuapp.com/api/admin/articles/$articleId', 
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    print(articlesResponse.statusCode);
    if(articlesResponse.statusCode == 204) {

        return store.dispatch(getAdminArticles(store: store));
    } else {
        return store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    return store.dispatch(SetArticlesStateAction(ArticlesState(isLoading: false, isError: err, isSuccess: false)));
  }
}

