class Article {

  int id;
  String description;
  String status;
  DateTime createdAt;

  Article({this.id, this.description, this.status, this.createdAt});

  Article.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    description = json['description'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  static List<Article> listFromJson(List<dynamic> json) {
    return json == null ? List<Article>() : json.map((value) => Article.fromJson(value)).toList();
  }

}