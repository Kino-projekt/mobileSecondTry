import 'package:flutter/material.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redux/redux.dart';

class DrawerUser extends StatefulWidget {


  DrawerUser(store);

  @override
  _DrawerUserState createState() => _DrawerUserState();
}

class _DrawerUserState extends State<DrawerUser> {
  Store<AppState> store;

   @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text('SCUTER',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                )),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.signOutAlt,
              color: Colors.black,
            ),
            title: Text(
              'Wyloguj',
              style: TextStyle(
                fontSize: 18.0
                ),
              ),
            onTap: () {
             store.dispatch(LogoutUser);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.grade,
              color: Colors.black,
            ),
            title: Text(
              'Moje rezerwacje',
              style: TextStyle(
                fontSize: 18.0
                ),
              ),
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
          ),
          ListTile(
            leading: FaIcon(
              FontAwesomeIcons.cog,
              color: Colors.black,
            ),
            title: Text(
              'Ustawienia',
              style: TextStyle(
                fontSize: 18.0
                ),
              ),
            onTap: () {
              Navigator.pushNamed(context, '/register');
            },
          ),
        ],
      ),
    );
  }
}
