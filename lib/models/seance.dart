import 'film.dart';

class Seance {

  Film film;
  int hallId;
  String date;
  List occupiedSeats;

  Seance({this.film, this.hallId, this.date, this.occupiedSeats});

  Seance.fromJson(Map<String, dynamic> json, Film film) {
    if (json == null) return;
    film = film;
    hallId = json['hallId'];
    date = json['date'];
    occupiedSeats = json['occupiedSeats'];
  }
}