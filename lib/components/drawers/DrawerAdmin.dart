import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DrawerAdmin extends StatelessWidget {
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
              Navigator.pushNamed(context, '/login');
            },
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
        ],
      ),
    );
  }
}