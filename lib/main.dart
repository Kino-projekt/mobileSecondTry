import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:flutter_reduxx/views/home.dart';
import 'package:flutter_reduxx/views/Login/login.dart';
import 'package:flutter_reduxx/views/Register/register.dart';
import 'package:redux/redux.dart';

Future<void> main() async {

  var store = await createStore();
  
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {

  final Store<AppState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {

    
    return StoreProvider(
      store: store, 
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black, 
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => Home(store),
          '/login': (BuildContext context) => Login(store),
          '/register': (BuildContext context) => Register(),
        },
      )
    );
  }
}

