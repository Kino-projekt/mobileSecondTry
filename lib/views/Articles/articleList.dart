import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/redux/initial/initial_state.dart';
import 'package:flutter_reduxx/redux/store.dart';

import 'articleCard.dart';


class ArticleList extends StatelessWidget {

  List<Widget> makesSingleFromNews(articles) {
    List<ArticleCard> articleList = new List();
    for (Article article in articles){
      articleList.add(ArticleCard(article: article));
    }
    return articleList;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, InitialState>(
      distinct: true,
      converter: (store) => store.state.initialState,
      builder: (context, initialState) {
       return initialState.articles.length > 0 ? ListView(
          scrollDirection: Axis.vertical,
          children: makesSingleFromNews(initialState.articles),
        ) : (
           Text('Brak artykułów do wyświetlenia')
        );
      }
    );
  }
}
      
  
