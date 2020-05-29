import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/seances.dart';

class SeanceCard extends StatelessWidget {

  final Seances seance;

  SeanceCard({this.seance});


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                seance.film.title.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('${seance.date} ${seance.hour}'),
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