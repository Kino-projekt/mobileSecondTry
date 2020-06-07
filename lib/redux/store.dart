import 'package:flutter/foundation.dart';
import 'package:flutter_reduxx/redux/articles/articles_state.dart';
import 'package:flutter_reduxx/redux/halls/halls_actions.dart';
import 'package:flutter_reduxx/redux/halls/halls_reducer.dart';
import 'package:flutter_reduxx/redux/halls/halls_state.dart';
import 'package:flutter_reduxx/redux/login/login_actions.dart';
import 'package:flutter_reduxx/redux/login/login_reducer.dart';
import 'package:flutter_reduxx/redux/login/login_state.dart';
import 'package:flutter_reduxx/redux/register/register_actions.dart';
import 'package:flutter_reduxx/redux/register/register_reducer.dart';
import 'package:flutter_reduxx/redux/register/register_state.dart';
import 'package:flutter_reduxx/redux/seances/seances_reducer.dart';
import 'package:flutter_reduxx/redux/seances/seances_state.dart';
import 'package:flutter_reduxx/redux/users/users_actions.dart';
import 'package:flutter_reduxx/redux/users/users_reducer.dart';
import 'package:flutter_reduxx/redux/users/users_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'articles/articles_actions.dart';
import 'articles/articles_reducer.dart';
import 'films/films_actions.dart';
import 'films/films_reducer.dart';
import 'films/films_state.dart';
import 'seances/seances_actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetLoginStateAction) {
    final nextLoginState = loginReducer(state.loginState, action);

    return state.copyWith(loginState: nextLoginState);
  }

  if (action is SetRegisterStateAction) {
    final nextRegisterState = registerReducer(state.registerState, action);

    return state.copyWith(registerState: nextRegisterState);
  }

  if (action is SetFilmsStateAction) {
    final nextInitialState = filmsReducer(state.filmsState, action);

    return state.copyWith(filmsState: nextInitialState);
  }

  if (action is SetArticlesStateAction) {
    final nextInitialState = articlesReducer(state.articlesState, action);

    return state.copyWith(articlesState: nextInitialState);
  }

  if (action is SetSeancesStateAction) {
    final nextInitialState = seancesReducer(state.seancesState, action);

    return state.copyWith(seancesState: nextInitialState);
  }

  if (action is SetUsersStateAction) {
    final nextInitialState = usersReduce(state.usersState, action);

    return state.copyWith(usersState: nextInitialState);
  }
  if (action is SetHallsStateAction) {
    final nextInitialState = hallsReducer(state.hallsState, action);

    return state.copyWith(hallsState: nextInitialState);
  }
  return state;
}

class AppState {
  
  final LoginState loginState;
  final RegisterState registerState;
  final FilmsState filmsState;
  final ArticlesState articlesState;
  final SeancesState seancesState;
  final UsersState usersState;
  final HallsState hallsState;

  AppState({
    @required this.loginState,
    @required this.registerState,
    @required this.filmsState,
    @required this.articlesState,
    @required this.seancesState,
    @required this.usersState,
    @required this.hallsState,
  });

  AppState copyWith({
    LoginState loginState,
    RegisterState registerState,
    FilmsState filmsState,
    ArticlesState articlesState,
    SeancesState seancesState,
    UsersState usersState,
    HallsState hallsState,
  }) {
    return AppState(
      loginState: loginState ?? this.loginState,
      registerState: registerState ?? this.registerState,
      filmsState: filmsState ?? this.filmsState,
      articlesState: articlesState ?? this.articlesState,
      seancesState: seancesState ?? this.seancesState,
      usersState: usersState ?? this.usersState,
      hallsState: hallsState ?? this.hallsState,
    );
  }
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final loginStateInitial = LoginState.initial();
    final registerStateInitial = RegisterState.initial();
    final filmStateInitial = FilmsState.initial();
    final articlesStateInitial = ArticlesState.initial();
    final seancesStateInitial = SeancesState.initial();
    final usersStateInitial = UsersState.initial();
    final hallsStateInitial = HallsState.initial();

    _store = Store<AppState>(
      appReducer,
      middleware: [thunkMiddleware],
      initialState: AppState(
        loginState: loginStateInitial, 
        registerState: registerStateInitial, 
        filmsState: filmStateInitial, 
        articlesState: articlesStateInitial,
        seancesState: seancesStateInitial,
        usersState: usersStateInitial,
        hallsState: hallsStateInitial,
      ),
    );
  }
}