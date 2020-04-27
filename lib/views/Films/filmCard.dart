import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/film.dart';

class FilmCard extends StatelessWidget {

  final Film film;

  FilmCard({this.film});


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.network(film.img),
              title: Text(
                film.title.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Od lat: ${film.minAge.toString()}'),
              isThreeLine: true,
              trailing: Text('Czas filmu: ${film.timeInMinutes.toString()}min'),
            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(0, 0, 30.0, 10.0),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.end,
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: <Widget>[
            //       Text(film.author),
            //     ],
            //   ),
            // ),
            SizedBox(height: 10.0),
          ],
        )
      );
  }
}