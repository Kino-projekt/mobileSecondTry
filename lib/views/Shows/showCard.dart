import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/showing.dart';

class ShowCard extends StatelessWidget {

  final Showing show;

  ShowCard({this.show});


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.network(show.film.img),
              title: Text(
                show.film.title.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('${show.date} ${show.hour}'),
            ),
            SizedBox(height: 10.0),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'CZYTAJ WIĘCEJ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  ),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text(
                    'ZAREZERWUJ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        )
      );
  }
}