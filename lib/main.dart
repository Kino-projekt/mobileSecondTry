import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:flutter_reduxx/views/home.dart';
import 'package:flutter_reduxx/views/Login/login.dart';
import 'package:flutter_reduxx/views/Register/register.dart';
import 'package:redux/redux.dart';

void main() async {

  await Redux.init();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    
    return StoreProvider(
      store: Redux.store, 
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black, 
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => Home(),
          '/login': (BuildContext context) => Login(),
          '/register': (BuildContext context) => Register(),
        },
      )
    );
  }
}

