import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/redux/articles/articles_actions.dart';
import 'package:flutter_reduxx/redux/articles/articles_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
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
    for (Article user in users){
      userList.add(AdminUserCard(user: user));
    }
    return userList;
  }

  String title = '';
  String description = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UsersState>(
      distinct: true,
      onInit: Redux.store.dispatch(getAdminArticles(store: Redux.store)),
      converter: (store) => store.state.articlesState,
      builder: (context, state) {
       return Scaffold(
            appBar: AppBar(
                title: Text('Artykuły'),
                backgroundColor: Colors.black,
              ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                          AlertDialog(
                            title: Text('Dodawanie nowego artykułu'),
                            content: Column(
                              children: <Widget>[
                                TextFormField(
                                  onChanged: (val) => setState(() => title = val),
                                  validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                                  decoration: InputDecoration(
                                    labelText: 'Tytuł'
                                  ),
                                ),
                                TextFormField(
                                  maxLines: 3,
                                  onChanged: (val) => setState(() => description = val),
                                  validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                                  decoration: InputDecoration(
                                    labelText: 'Treść'
                                  ),
                                ),
                              ]
                            ),
                            actions: [
                              FlatButton(
                                onPressed: () async {
                                  await Redux.store.dispatch(addArticle(store: Redux.store, title: title, description: description));
                                  Navigator.of(context).pop();
                                },
                                textColor: Colors.greenAccent,
                                child: Text('DODAJ')
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                textColor: Colors.black,
                                child: Text('ANULUJ')
                              ),
                            ],
                          )
                        );
              },
              backgroundColor: Colors.black,
              child: Icon(Icons.add),
              ),
            body: state.isLoading ? Center(
              child: (
                Loading(indicator: BallPulseIndicator(), size: 100.0, color: Colors.black)
                ),
            ) : state.articles != null && state.articles.length > 0 
              ? ListView(
                scrollDirection: Axis.vertical,
                children: makesSingleFromNews(state.articles),
              ) : (
              Text('Brak artykułów do wyświetlenia')
          ),
       );
      }
    );
  }
}
      
  
