import 'dart:io';

import 'package:flutter_reduxx/models/hall.dart';
import 'package:flutter_reduxx/redux/halls/halls_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class SetHallsStateAction {
  final HallsState hallsState;

  SetHallsStateAction(this.hallsState);
}

Future<void> getHalls({store}) async { 
  if(store.state.hallsState.isSuccess == true) return;
  try {
    store.dispatch(SetHallsStateAction(HallsState(isLoading: true, isError: false, isSuccess: false)));
    var hallsResponse = await http.get('https://afternoon-waters-37189.herokuapp.com/api/halls/');
    if(hallsResponse.statusCode == 200) {
        var hallsBody = await json.decode(hallsResponse.body);

        List<Hall> halls = hallsBody.map<Hall>((hall) => Hall.fromJson(hall)).toList();

        return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: false, isSuccess: true, halls: halls)));
      } else {
        return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    print(err);
    return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isSuccess: false)));
  }
}

Future<void> deleteHall({store, hallId}) async { 
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    store.dispatch(SetHallsStateAction(HallsState(isLoading: true, isError: false, isSuccess: false)));
    String token = prefs.getString('token');
    var hallsResponse = await http.delete('https://afternoon-waters-37189.herokuapp.com/api/admin/halls/$hallId', headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},);
    if(hallsResponse.statusCode == 204) {
        store.dispatch(SetHallsStateAction(HallsState(isSuccess: false)));
        return store.dispatch(getHalls(store: store));
      } else {
        return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    print(err);
    return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isSuccess: false)));
  }
}

Future<void> addHall({store, name, countOfSeats}) async { 
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    store.dispatch(SetHallsStateAction(HallsState(isLoading: true, isError: false, isSuccess: false)));
    String token = prefs.getString('token');
    Map<String, dynamic> object = {
      "name": name,
      "countOfSeats": countOfSeats
    };
    print(object);
    var hallsResponse = await http.post('https://afternoon-waters-37189.herokuapp.com/api/admin/halls', 
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token', "Content-Type": "application/json"},
      body: jsonEncode(object)
    );
    print(hallsResponse.body);
    if(hallsResponse.statusCode == 201) {
        store.dispatch(SetHallsStateAction(HallsState(isSuccess: false)));
        return store.dispatch(getHalls(store: store));
      } else {
        return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    print(err);
    return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isSuccess: false)));
  }
}