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

// Future<void> addComment({store, hallId, comment}) async { 
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   try {
//     store.dispatch(SetHallsStateAction(HallsState(isLoading: true, isError: false)));
//     String token = prefs.getString('token');
//     var res = await http.post('https://afternoon-waters-37189.herokuapp.com/api/comments/', 
//       headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
//       body: {
//         "content": comment,
//         "movieId": hallId.toString(),
//       },
//     );
//     if(res.statusCode == 201) {
//       store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: false, isSuccess: false)));
//       return store.dispatch(getHalls(store: store));
//     } else {
//       return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: false)));
//     }
//   } catch (err) {
//     print(err);
//     return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: false)));
//   }
// }

// Future<void> addFilm({store, title, director, description}) async { 
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   try {
//     store.dispatch(SetHallsStateAction(HallsState(isLoading: true, isError: false)));
//     String token = prefs.getString('token');
//     var res = await http.post('https://afternoon-waters-37189.herokuapp.com/api/admin/movies', 
//       headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
//       body: {
//         "title": title,
//         "director": director,
//         "description": description,
//       },
//     );
//     if(res.statusCode == 201) {
//       store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: false, isSuccess: false)));
//       return store.dispatch(getHalls(store: store));
//     } else {
//       return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: false)));
//     }
//   } catch (err) {
//     print(err);
//     return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: false)));
//   }
// }

// Future<void> deleteFilm({store, id}) async { 
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   try {
//     store.dispatch(SetHallsStateAction(HallsState(isLoading: true, isError: false)));
//     String token = prefs.getString('token');
//     var res = await http.delete('https://afternoon-waters-37189.herokuapp.com/api/admin/movies/$id', 
//       headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
//     );
//     if(res.statusCode == 204) {
//       store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: false, isSuccess: false)));
//       return store.dispatch(getHalls(store: store));
//     } else {
//       return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: false)));
//     }
//   } catch (err) {
//     print(err);
//     return store.dispatch(SetHallsStateAction(HallsState(isLoading: false, isError: false)));
//   }
// }

