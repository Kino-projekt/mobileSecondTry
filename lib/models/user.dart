import 'package:flutter_reduxx/models/role.dart';

class User {

  final String email;
  final String token;
  final int id;
  final Role role;

  User({this.email, this.token, this.id, this.role = Role.ANONYMOUS});
  
  User.init() : email = '', id = null, role = Role.ANONYMOUS, token = '';
}