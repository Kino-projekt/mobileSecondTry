import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:flutter_reduxx/redux/users/users_actions.dart';
import 'package:flutter_reduxx/redux/users/users_state.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import 'adminUserCard.dart';


class AdminUserList extends StatefulWidget {

  @override
  _AdminUserListState createState() => _AdminUserListState();
}

class _AdminUserListState extends State<AdminUserList> {
  List<Widget> makesSingleFromUsers(users) {
    List<AdminUserCard> userList = new List();
    for (User user in users){
      userList.add(AdminUserCard(user: user));
    }
    return userList;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UsersState>(
      distinct: true,
      onInit: Redux.store.dispatch(getUsers(store: Redux.store)),
      converter: (store) => store.state.usersState,
      builder: (context, state) {
       return Scaffold(
            appBar: AppBar(
                title: Text('Użytkownicy'),
                backgroundColor: Colors.black,
              ),
            body: state.isLoading ? Center(
              child: (
                Loading(indicator: BallPulseIndicator(), size: 100.0, color: Colors.black)
              ),
            ) : state.users != null && state.users.length > 0 
              ? ListView(
                scrollDirection: Axis.vertical,
                children: makesSingleFromUsers(state.users),
              ) : (
              Text('Brak użytkowników do wyświetlenia')
          ),
       );
      }
    );
  }
}
      
  
