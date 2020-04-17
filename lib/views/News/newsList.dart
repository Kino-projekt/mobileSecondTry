import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/news.dart';
import 'package:flutter_reduxx/models/showing.dart';

import 'newsCard.dart';


class NewsList extends StatelessWidget {

  final List<News> news;

  NewsList({this.news});

  List<Widget> makesSingleFromNews() {
    List<NewsCard> newsList = new List();
    for (News news in news){
      newsList.add(NewsCard(news: news));
    }
    return newsList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: makesSingleFromNews(),
          );
        }
      }
      
  
