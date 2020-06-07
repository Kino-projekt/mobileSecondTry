import 'dart:io';

import 'package:flutter_reduxx/models/seance.dart';
import 'package:flutter_reduxx/redux/seances/seances_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class SetSeancesStateAction {
  final SeancesState seancesState;

  SetSeancesStateAction(this.seancesState);
}

Future<void> getSeances({store}) async { 

  if(store.state.seancesState.isSuccess == true) return;

  try {
    store.dispatch(SetSeancesStateAction(SeancesState(isLoading: true, isError: false, isSuccess: false)));
    var seancesResponse = await http.get('https://afternoon-waters-37189.herokuapp.com/api/seances/');

    if(seancesResponse.statusCode == 200) {
        var seancesBody = await json.decode(seancesResponse.body);
        List<Seance> seances = seancesBody.map<Seance>((seance) => Seance.fromJson(seance)).toList();

        return store.dispatch(SetSeancesStateAction(SeancesState(isLoading: false, isError: false, isSuccess: true, seances: seances)));
      } else {
        return store.dispatch(SetSeancesStateAction(SeancesState(isLoading: false, isError: true, isSuccess: false)));
      }
  } catch (err) {
    print(err);
    // return store.dispatch(SetSeancesStateAction(SeancesState(isLoading: false, isError: err, isSuccess: false)));
  }
}

Future<void> addSeance({store, hallId, filmId, date}) async {
  try {
    store.dispatch(SetSeancesStateAction(SeancesState(isLoading: true)));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    var res = await http.post('https://afternoon-waters-37189.herokuapp.com/api/admin/seances', 
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      body: {
        "hallId": hallId.toString(),
        "movieId": filmId.toString(),
        "date": date.toIso8601String(),
      },
    );
    if(res.statusCode == 201) {
      store.dispatch(SetSeancesStateAction(SeancesState(isSuccess: false)));
      return store.dispatch(getSeances(store: store));
    } else {
      return store.dispatch(SetSeancesStateAction(SeancesState(isLoading: false, isError: false)));
    }
  } catch (err){
    store.dispatch(SetSeancesStateAction(SeancesState(isLoading: false, isError: true)));
    print(err);
  }
}

Future<void> deleteSeance({store, id}) async {
  try {
    store.dispatch(SetSeancesStateAction(SeancesState(isLoading: true)));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    var res = await http.delete('https://afternoon-waters-37189.herokuapp.com/api/admin/seances/$id', 
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    if(res.statusCode == 204) {
      store.dispatch(SetSeancesStateAction(SeancesState(isSuccess: false)));
      return store.dispatch(getSeances(store: store));
    } else {
      return store.dispatch(SetSeancesStateAction(SeancesState(isLoading: false, isError: false)));
    }
  } catch (err){
    store.dispatch(SetSeancesStateAction(SeancesState(isLoading: false, isError: true)));
    print(err);
  }
}

Future<void> book({store, seanceId, reservedSeats}) async {
  try {
    store.dispatch(SetSeancesStateAction(SeancesState(isLoading: true)));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    print(seanceId);
    print(reservedSeats);
    var res = await http.post('https://afternoon-waters-37189.herokuapp.com/api/bookings', 
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      body: {
        "reservedSeats": reservedSeats.toString(),
        "seanceId": seanceId.toString(),
      }
    );
    print(res.body);
    if(res.statusCode == 201) {
      store.dispatch(SetSeancesStateAction(SeancesState(isSuccess: false)));
      return store.dispatch(getSeances(store: store));
    } else {
      return store.dispatch(SetSeancesStateAction(SeancesState(isLoading: false, isError: false)));
    }
  } catch (err){
    store.dispatch(SetSeancesStateAction(SeancesState(isLoading: false, isError: true)));
    print(err);
  }
}

