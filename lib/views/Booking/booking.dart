import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/seance.dart';
import 'package:flutter_reduxx/redux/seances/seances_actions.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';


class Booking extends StatefulWidget {

  final Seance seance;
  Booking({this.seance});

  @override
  _BookingState createState() => _BookingState(checked: List.generate(seance.hall.countOfSeats, (i) => {"index": i, "checked": false}), booked: seance.occupiedSeats);
}

class _BookingState extends State<Booking> with SingleTickerProviderStateMixin {

  String ticket = '';
  List checked;
  List booked;
  _BookingState({this.checked, this.booked});
  
  makeButtons(){
    List<Widget> list = checked.map<Widget>((item) =>
    !booked.any((i) => i == item['index']) ? Checkbox(value: item["checked"], activeColor: Colors.pinkAccent, onChanged: (b){
      var i = item['index'];
      setState(() {
        checked[i]["checked"] = b; 
      });
    }) : Checkbox(value: true, onChanged: null,)
      
    
    
    ).toList();
    return list;
  }
  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(widget.seance.date);
    return (
      StoreConnector<AppState, AppState>(
        distinct: true,
        converter: (store) => store.state,
        builder: (context, appState) {
          if (appState.seancesState.isLoading || appState.filmsState.isLoading || appState.hallsState.isLoading) {
            return Center(
                  child: Loading(indicator: BallPulseIndicator(), size: 100.0),
                );
          } else {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text('Zarezerwuj miejsce'),
                backgroundColor: Colors.black,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child:  Column(
                    children: [
                      Text(
                        'Tytuł filmu: ${widget.seance.film.title}', 
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.bold
                        )),
                      SizedBox(height: 10),
                      Text('Data: ${date.day}.${date.month}.${date.year}', style: TextStyle(
                          fontSize: 20, 
                        )),
                      SizedBox(height: 10),
                      Wrap(
                        direction: Axis.horizontal,
                        children: makeButtons(),
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                      color: Colors.pinkAccent,
                      child: Text(
                        'ZAREZERWUJ',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                        ),
                      onPressed: () {
                        List<int> seats = checked.where((e) => e["checked"] == true).map<int>((e) => e["index"]).toList();
                        Redux.store.dispatch(book(store: Redux.store, seanceId: widget.seance.id.toString(), reservedSeats: seats));
                        Navigator.of(context).pop((route) => false);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0)),
                            child: Container(
                              height: 100,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Zarezerwowałeś następujące miejsca: ${seats.toString()}')
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                      },
                    ),
                    ],
                  )
                ),
              ),
            );
          }
        },
      )
    );
  }
}