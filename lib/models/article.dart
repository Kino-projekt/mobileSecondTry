class Article {

  int id;
  String title;
  String description;
  String status;
  String createdAt;
  int userId;

  Article({this.id, this.description, this.status, this.createdAt, this.title, this.userId});

  String get articleTitle {
    return title;
  }

  Article.fromJson(Map<String, dynamic> json) 
    :id = json['id'],
    title = json['title'],
    description = json['description'],
    status = json['status'],
    createdAt = json['createdAt'],
    userId = json['userId'];
  
}