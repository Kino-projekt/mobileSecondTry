import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/redux/films/films_actions.dart';
import 'package:flutter_reduxx/redux/store.dart';

class FilmCard extends StatelessWidget {

  final Film film;

  FilmCard({this.film});

  makeComments(comments){
    List<Widget> commentsList = comments.map<Widget>((comment) => ListTile(
      title: Text(comment.content, textAlign: TextAlign.left, style: TextStyle(
        fontSize: 14
      )),
      subtitle: Text(comment.user.email,textAlign: TextAlign.left, style: TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.italic,
            color: Colors.redAccent,
          )), 
      trailing: Icon(Icons.delete_outline, size: 20, color: Colors.redAccent), 
      )).toList();
    return commentsList;
  }


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(
                film.title.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(film.description),
              isThreeLine: true,
              trailing: Text(film.director),
            ),
            film.comments.length > 0 ? 
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: makeComments(film.comments),
              ),
            ) : Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Brak komentarzy"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Dodaj komentarz',
                ),
                onSubmitted: (value) {
                  Redux.store.dispatch(addComment(store: Redux.store, filmId: film.id, comment: value));
                }
              ),
            )
          ],
        )
      );
  }
}