import 'package:flutter/material.dart';

class DrawerAnonymous extends StatefulWidget {
  @override
  _DrawerAnonymousState createState() => _DrawerAnonymousState();
}

class _DrawerAnonymousState extends State<DrawerAnonymous> {
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
                Icons.add_circle,
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
          ],
        ),
      );
  }
}