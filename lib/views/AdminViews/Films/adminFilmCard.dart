import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/redux/films/films_actions.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:flutter_reduxx/redux/users/users_actions.dart';

class AdminFilmCard extends StatefulWidget {

  final Film film;

  AdminFilmCard({this.film});

  @override
  _AdminFilmCardState createState() => _AdminFilmCardState();
}

class _AdminFilmCardState extends State<AdminFilmCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                widget.film.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(widget.film.director),
              leading: Text(widget.film.id.toString()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    Redux.store.dispatch(deleteFilm(store: Redux.store, id: widget.film.id));
                  },
                  textColor: Colors.redAccent,
                  child: Text('USUŃ')
                ),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        )
      );
  }
}