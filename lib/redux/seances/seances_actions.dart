import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/models/seance.dart';
import 'package:flutter_reduxx/redux/seances/seances_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meta/meta.dart';

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

