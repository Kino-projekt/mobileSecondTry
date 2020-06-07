import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/redux/articles/articles_actions.dart';
import 'package:flutter_reduxx/redux/articles/articles_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import 'adminArticleCard.dart';


class AdminArticleList extends StatefulWidget {

  @override
  _AdminArticleListState createState() => _AdminArticleListState();
}

class _AdminArticleListState extends State<AdminArticleList> {
  List<Widget> makesSingleFromNews(articles) {
    List<AdminArticleCard> articleList = new List();
    for (Article article in articles){
      articleList.add(AdminArticleCard(article: article));
    }
    return articleList;
  }

  String title = '';
  String description = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ArticlesState>(
      distinct: true,
      onInit: Redux.store.dispatch(getAdminArticles(store: Redux.store)),
      converter: (store) => store.state.articlesState,
      builder: (context, state) {
       return Scaffold(
            appBar: AppBar(
                title: Text('Artykuły'),
                backgroundColor: Colors.black,
              ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addArticle');
              },
              backgroundColor: Colors.black,
              child: Icon(Icons.add),
              ),
            body: state.isLoading ? Center(
              child: (
                Loading(indicator: BallPulseIndicator(), size: 100.0, color: Colors.black)
                ),
            ) : state.articles != null && state.articles.length > 0 
              ? ListView(
                scrollDirection: Axis.vertical,
                children: makesSingleFromNews(state.articles),
              ) : (
              Text('Brak artykułów do wyświetlenia')
          ),
       );
      }
    );
  }
}
      
  
