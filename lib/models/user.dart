class User {

  String email;
  String token;
  int id;
  String role;

  User({this.email, this.token, this.id, this.role});

  User.fromJson(List<dynamic> json) {
    if (json == null) return;
    email = json[0]['email'];
    id = json[0]['id'];
    role = json[0]['role'];
    token = json[1]['accessToken'];
  }
  
  User.init() : email = null, id = null, role = 'ANONYMOUS', token = null;
}