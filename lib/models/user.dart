class User {

  String email;
  int id;
  String role;

  User({this.email, this.id, this.role});

  User.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    email = json['email'];
    id = json['id'];
    role = json['role'];
  }
  
  User.init() : email = null, id = null, role = 'ANONYMOUS';
}