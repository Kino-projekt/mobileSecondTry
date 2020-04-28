import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/components/drawers/drawer_viewmodel.dart';
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
    return new StoreConnector(
      converter: ((Store<AppState> store) => DrawerViewModel.create(store)),
      builder: (BuildContext context, DrawerViewModel viewModel) =>
      Drawer (
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.fromLTRB(10.0, 100.0, 0, 0),
              child: Text(
                viewModel.user.email != '' ? viewModel.user.email : 'SCUTER',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                )),
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
              onTap: () {
                viewModel.logoutUser();
              },
            ),
          ],
        ),
      ),
    );
  }
}
