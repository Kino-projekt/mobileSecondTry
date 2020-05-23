import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/article.dart';

class ArticleCard extends StatelessWidget {

  final Article article;

  ArticleCard({this.article});

  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(article.createdAt);

    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(article.description),
              isThreeLine: true,
              trailing: Text('${date.day}.${date.month}.${date.year}'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30.0, 10.0),
              // child: Row(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: <Widget>[
              //     Text(article.author),
              //   ],
              // ),
            ),
            SizedBox(height: 10.0),
          ],
        )
      );
  }
}