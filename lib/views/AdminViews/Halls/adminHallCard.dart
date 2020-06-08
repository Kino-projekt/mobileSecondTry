import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/hall.dart';
import 'package:flutter_reduxx/redux/halls/halls_actions.dart';
import 'package:flutter_reduxx/redux/store.dart';

class AdminHallCard extends StatefulWidget {

  final Hall hall;

  AdminHallCard({this.hall});

  @override
  _AdminHallCardState createState() => _AdminHallCardState();
}

class _AdminHallCardState extends State<AdminHallCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                widget.hall.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Liczba miejsc: ${widget.hall.countOfSeats}'),
              isThreeLine: true,  
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 30.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                      onPressed: () {
                        showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                          AlertDialog(
                            title: Text('Czy na pewno chcesz usunąć hale ${widget.hall.name}'),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  deleteHall(hallId: widget.hall.id, store: Redux.store);
                                  Navigator.of(context).pop();
                                },
                                textColor: Colors.redAccent,
                                child: Text('USUŃ')
                              ),
                            ],
                          )
                        );
                      },
                      textColor: Colors.redAccent,
                      child: Text('USUŃ')
                    ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
          ],
        )
      );
  }
}