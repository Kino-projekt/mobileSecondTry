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
              subtitle: Text(news.text),
              isThreeLine: true,
              trailing: Text(news.createDate),
            ),
            // SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30.0, 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(news.author),
                ],
              ),
            ),
            SizedBox(height: 10.0),
          ],
        )
      );
  }
}