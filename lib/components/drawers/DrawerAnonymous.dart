import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerAnonymous extends StatelessWidget {
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
              FontAwesomeIcons.signInAlt,
              color: Colors.black,
            ),
            title: Text(
              'Logowanie',
              style: TextStyle(
                fontSize: 18.0
                ),
              ),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.assignment,
              color: Colors.black,
            ),
            title: Text(
              'Rejestracja',
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
        ],
      ),
    );
  }
}
