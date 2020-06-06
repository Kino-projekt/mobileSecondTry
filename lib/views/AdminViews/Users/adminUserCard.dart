import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/redux/articles/articles_actions.dart';
import 'package:flutter_reduxx/redux/store.dart';

class AdminUserCard extends StatefulWidget {

  final Article article;

  AdminUserCard({this.article});

  @override
  _AdminUserCardState createState() => _AdminUserCardState();
}

class _AdminUserCardState extends State<AdminUserCard> {

  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(widget.article.createdAt);
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                widget.article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(widget.article.description),
              isThreeLine: true,
              trailing: Text('${date.day}.${date.month}.${date.year}'),
              leading: 
              FlatButton(
                onPressed: () {
                  toggleActive(store: Redux.store, status: widget.article.status == "ACTIVE" ? "INACTIVE" : "ACTIVE", articleId: widget.article.id);
                },
                child: Text(widget.article.status),
                color: widget.article.status == "ACTIVE" ? Colors.greenAccent : Colors.redAccent
              )    
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                      onPressed: () {
                        showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                          AlertDialog(
                            title: Text('Czy na pewno chcesz usunąć artykuł o ID ${widget.article.id}'),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  deleteArticle(articleId: widget.article.id, store: Redux.store);
                                  Navigator.of(context).pop();
                                },
                                textColor: Colors.redAccent,
                                child: Text('USUŃ')
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                textColor: Colors.black,
                                child: Text('ANULUJ')
                              ),
                            ],
                          )
                        );
                      },
                      textColor: Colors.redAccent,
                      child: Text('USUŃ')
                    ),
                  FlatButton(
                    onPressed: () {
                      
                    },
                    textColor: Colors.blueAccent,
                    child: Text('EDYTUJ')
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
          ],
        )
      );
  }
}