import 'package:flutter/material.dart';
import 'package:flutter_reduxx/views/home.dart';
import 'package:flutter_reduxx/views/login.dart';
import 'package:flutter_reduxx/views/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black, 
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/login': (context) => Login(),
          '/register': (context) => Register(),
        },
    );
  }
}

