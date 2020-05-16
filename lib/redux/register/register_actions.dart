import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/redux/register/register_state.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

@immutable
class SetRegisterStateAction {
  final RegisterState registerState;

  SetRegisterStateAction(this.registerState);
}

Future<void> registerUser({Auth auth, store}) async { 
  try {
    store.dispatch(SetRegisterStateAction(RegisterState(isLoading: true, isError: false, isSuccess: false)));
    
    var res = await http.post('https://afternoon-waters-37189.herokuapp.com/api/auth/signin/', body: {
      "password": auth.password,
      "email": auth.email,
    });
  if(res.statusCode == 201) {
      return store.dispatch(SetRegisterStateAction(RegisterState(isLoading: false, isError: false, isSuccess: true)));
    } else {
      return store.dispatch(SetRegisterStateAction(RegisterState(isLoading: false, isError: true, isSuccess: false)));
    }
  } catch (err) {
    return store.dispatch(SetRegisterStateAction(RegisterState(isLoading: false, isError: true, isSuccess: false)));
  }
}

Future<void> logoutUser (store) async {
  print('wylogowywanie');
  return store.dispatch(SetRegisterStateAction(RegisterState.initial()));
}

