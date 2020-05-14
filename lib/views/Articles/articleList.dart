import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/models/showing.dart';

import 'articleCard.dart';


class ArticleList extends StatelessWidget {

  final List<Article> articles;

  ArticleList({this.articles});

  List<Widget> makesSingleFromNews() {
    List<ArticleCard> articleList = new List();
    for (Article article in articles){
      articleList.add(ArticleCard(article: article));
    }
    return articleList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: makesSingleFromNews(),
          );
        }
      }
      
  
