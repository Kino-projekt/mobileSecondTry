import 'package:flutter_reduxx/models/user.dart';

class Comment {

  String content;
  int movieId;
  User user;

  Comment({this.content, this.movieId, this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    content = json['content'];
    movieId = json['movieId'];
    user = User.fromJson(json['user']);
  }
}