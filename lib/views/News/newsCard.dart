import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/news.dart';

class NewsCard extends StatelessWidget {

  final News news;

  NewsCard({this.news});


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.network(news.img),
              title: Text(
                news.content.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('${news.createDate} ${news.author}'),
            ),
            SizedBox(height: 10.0),
          ],
        )
      );
  }
}