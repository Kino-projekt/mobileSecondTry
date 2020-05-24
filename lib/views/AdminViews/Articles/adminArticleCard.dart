import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/article.dart';

class AdminArticleCard extends StatefulWidget {

  final Article article;

  AdminArticleCard({this.article});

  @override
  _AdminArticleCardState createState() => _AdminArticleCardState();
}

class _AdminArticleCardState extends State<AdminArticleCard> {
    String dropdownValue = '3';



  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(widget.article.createdAt);
    print(dropdownValue);
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
                DropdownButton(
                  value: dropdownValue,
                  items: [
                    DropdownMenuItem(child: Text('Unactive'), value: 'Unactive',),
                    DropdownMenuItem(child: Text('Active'), value: 'Active',),
                  ],
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                ),
                
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