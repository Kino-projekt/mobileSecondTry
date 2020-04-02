import 'package:flutter/material.dart';

class DrawerUser extends StatelessWidget {

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
            leading: Icon(
              Icons.send,
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
            leading: Icon(
              Icons.add_circle,
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
            leading: Icon(
              Icons.add_circle,
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
