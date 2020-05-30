import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/redux/articles/articles_actions.dart';
import 'package:flutter_reduxx/redux/articles/articles_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import 'articleCard.dart';


class ArticleList extends StatelessWidget {

  List<Widget> makesSingleFromNews(articles) {
    List active = articles.where((article) => article.status == "ACTIVE").toList();
    List<ArticleCard> articleList = active.map<ArticleCard>((article) => ArticleCard(article: article)).toList();
    return articleList;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ArticlesState>(
      onInit: Redux.store.dispatch(getArticles(store: Redux.store)),
      converter: ((store) => store.state.articlesState),
      builder: (context, articlesState) {
       return articlesState.isLoading ? (
         Loading(indicator: BallPulseIndicator(), size: 100.0, color: Colors.black)
       ) : 
       articlesState.articles != null && articlesState.articles.length > 0 ? ListView(
          scrollDirection: Axis.vertical,
          children: makesSingleFromNews(articlesState.articles),
        ) : (
           Text('Brak artykułów do wyświetlenia')
        );
      }
    );
  }
}
      
  
