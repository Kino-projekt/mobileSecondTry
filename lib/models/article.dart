class Article {

  int id;
  String title;
  String description;
  String status;
  String createdAt;
  int userId;

  Article({this.id, this.description, this.status, this.createdAt, this.title, this.userId});

  Article.fromJson(dynamic json) {
    var id = json['id'];
    var title = json['title'];
    var description = json['description'];
    var status = json['status'];
    var createdAt = json['createdAt'];
    var userId = json['userId'];
    Article(createdAt: createdAt, id: id, title: title, description: description, status: status, userId: userId);
  }
}