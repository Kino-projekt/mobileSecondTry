import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/redux/login/login_actions.dart';
import 'package:flutter_reduxx/redux/login/login_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DrawerAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginState>(
      converter: ((store) => store.state.loginState),
      builder: (context, loginState) => 
      Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                  loginState.user.email != '' ? loginState.user.email :'SCUTER',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  )),
                  SizedBox(height: 10.0),
                  Text(
                  loginState.user.role.toString().substring(5),
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    letterSpacing: 1.0,
                  )),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.newspaper,
                color: Colors.black,
              ),
              title: Text(
                'Newsy',
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
                FontAwesomeIcons.film,
                color: Colors.black,
              ),
              title: Text(
                'Seanse',
                style: TextStyle(
                  fontSize: 18.0
                  ),
                ),
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.videocam,
                color: Colors.black,
              ),
              title: Text(
                'Filmy',
                style: TextStyle(
                  fontSize: 18.0
                  ),
                ),
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(
                'Użytkownicy',
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
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.qrcode,
                color: Colors.red,
              ),
              title: Text(
                'Sprawdzarka biletów',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.red,
                  ),
                ),
              onTap: () {
                Navigator.pushNamed(context, '/register');
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