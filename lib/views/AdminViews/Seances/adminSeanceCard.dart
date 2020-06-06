import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/seance.dart';
import 'package:flutter_reduxx/redux/store.dart';

class AdminSeanceCard extends StatefulWidget {

  final Seance seance;

  AdminSeanceCard({this.seance});

  @override
  _AdminSeanceCardState createState() => _AdminSeanceCardState();
}

class _AdminSeanceCardState extends State<AdminSeanceCard> {

  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(widget.seance.date);
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                widget.seance.film.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('${date.day}.${date.month}.${date.year}'),
              trailing: Text('Hala ${widget.seance.id.toString()}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    // Redux.store.dispatch(deleteSeance(store: Redux.store, id: widget.seance.id));
                  },
                  textColor: Colors.redAccent,
                  child: Text('USUŃ')
                ),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        )
      );
  }
}