class Film {

  int id;
  String title;
  String description;
  String director;
  DateTime createdAt;

  Film({this.id, this.title, this.description, this.director, this.createdAt});

  Film.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    title = json['title'];
    description = json['description'];
    director = json['director'];
    createdAt = json['createdAt'];
  }

  static List<Film> listFromJson(List<dynamic> json) {
    return json == null ? List<Film>() : json.map((value) => Film.fromJson(value)).toList();
  }

}