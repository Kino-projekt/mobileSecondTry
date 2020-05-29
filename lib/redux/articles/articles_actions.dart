import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/redux/articles/articles_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';

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

