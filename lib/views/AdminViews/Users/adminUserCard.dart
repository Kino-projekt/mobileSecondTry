import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:flutter_reduxx/redux/users/users_actions.dart';

class AdminUserCard extends StatefulWidget {

  final User user;

  AdminUserCard({this.user});

  @override
  _AdminUserCardState createState() => _AdminUserCardState();
}

class _AdminUserCardState extends State<AdminUserCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                widget.user.email,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(widget.user.role),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                widget.user.role != "ADMIN" ? FlatButton(
                    onPressed: () {
                      Redux.store.dispatch(banUser(store: Redux.store, id: widget.user.id));
                    },
                    textColor: Colors.redAccent,
                    child: Text('ZBANUJ')
                  ) : SizedBox(),
                widget.user.role != "ADMIN" ? FlatButton(
                  onPressed: () {
                    Redux.store.dispatch(giveAdmin(store: Redux.store, id: widget.user.id));
                  },
                  textColor: Colors.blueAccent,
                  child: Text('NADAJ ADMINA')
                ) : SizedBox(),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        )
      );
  }
}