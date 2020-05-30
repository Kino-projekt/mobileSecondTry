import 'package:flutter_reduxx/models/hall.dart';
import 'film.dart';

class Seance {

  int id;
  Film film;
  Hall hall;
  String date;
  List occupiedSeats;

  Seance({this.film, this.hall, this.date, this.occupiedSeats, this.id});

  Seance.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    film = Film.fromJson(json['movie']);
    hall = Hall.fromJson(json['hall']);
    date = json['date'];
    id = json['id'];
    occupiedSeats = json['occupiedSeats'];
  }
}