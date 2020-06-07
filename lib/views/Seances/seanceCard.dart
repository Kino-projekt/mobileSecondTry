import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/seance.dart';
import 'package:flutter_reduxx/views/Booking/booking.dart';

class SeanceCard extends StatelessWidget {

  final Seance seance;

  SeanceCard({this.seance});

  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(seance.date);
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
              subtitle: Text('${date.day}.${date.month}.${date.year}'),
            ),
            SizedBox(height: 10.0),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'ZAREZERWUJ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Booking(seance: seance),
                    ));
                  },
                ),
              ],
            ),
          ],
        )
      );
  }
}