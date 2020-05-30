import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/redux/login/login_actions.dart';
import 'package:flutter_reduxx/redux/login/login_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerUser extends StatefulWidget {


  @override
  _DrawerUserState createState() => _DrawerUserState();
}

class _DrawerUserState extends State<DrawerUser> {

   @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginState>(
      converter: ((store) => store.state.loginState),
      builder: (context, loginState) => 
      Drawer (
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                  loginState.user.email,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  )),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
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
                Navigator.pushNamed(context, '/settings');
              },
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
              onTap: () async {
                await Redux.store.dispatch(logoutUser(Redux.store));
              },
            ),
          ],
        ),
      ),
    );
  }
}
