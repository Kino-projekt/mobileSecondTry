import 'package:flutter_reduxx/models/comment.dart';

class Film {

  int id;
  String title;
  String description;
  String director;
  String createdAt;
  List<Comment> comments;

  Film({this.id, this.title, this.description, this.director, this.createdAt, this.comments});

  Film.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    title = json['title'];
    description = json['description'];
    director = json['director'];
    createdAt = json['createdAt'];
    comments = json['comments'].length != 0 ? json['comments'].map((comment) => Comment.fromJson(comment)).toList() : new List<Comment>();
  }
}