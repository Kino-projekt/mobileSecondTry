import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/redux/articles/articles_actions.dart';
import 'package:flutter_reduxx/redux/articles/articles_state.dart';
import 'package:flutter_reduxx/redux/store.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';


class AddArticle extends StatefulWidget {


  @override
  _AddArticleState createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> with SingleTickerProviderStateMixin {
  String title;
  String content;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return (
      StoreConnector<AppState, ArticlesState>(
        distinct: true,
        converter: (store) => store.state.articlesState,
        onWillChange: (ArticlesState prev, ArticlesState state) {
          if(prev.articles.length != state.articles.length) {
            Navigator.of(context).pop((route) => false);
            return null;
          }
        },
        builder: (context, articlesState) {
          if (articlesState.isLoading) {
            return Center(
                  child: Loading(indicator: BallPulseIndicator(), size: 100.0),
                );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Dodaj artykuł'),
                backgroundColor: Colors.black,
              ),
              body: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                        child: Column(
                        children: <Widget>[
                         TextFormField(
                          onChanged: (val) => setState(() => title = val),
                          validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                          decoration: InputDecoration(
                            labelText: 'Wpisz tytuł filmu'
                          ),
                        ),
                        TextFormField(
                          onChanged: (val) => setState(() => content = val),
                          validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                          decoration: InputDecoration(
                            labelText: 'Wpisz treść artykułu'
                          ),
                        ),
                        SizedBox(height: 30),
                          FlatButton(
                              onPressed: () async {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                } else {
                                  Redux.store.dispatch(addArticle(store: Redux.store, title: title, description: content));
                                }                              
                              },
                              color: Colors.pinkAccent,
                              child: Text(
                                'DODAJ NOWY ARTYKUŁ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                ),
              )
            );
          }
        },
      )
    );
  }
}