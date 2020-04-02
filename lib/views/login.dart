import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Logowanie'),
      backgroundColor: Colors.pinkAccent,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Zaloguj się'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  onChanged: (val) => setState(() => email = val),
                  validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                  decoration: InputDecoration(
                    labelText: 'Enter your email'
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) => setState(() => password = val),
                  validator: (val) => val.isEmpty ? 'Plese enter some text' : null,
                  decoration: InputDecoration(
                    labelText: 'Enter your password'
                  ),
                ),
                SizedBox(height: 10.0),
                FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _displaySnackBar(context);
                    }
                  },
                  color: Colors.pinkAccent,
                  child: Text(
                    'ZALOGUJ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
        ),
      )
    );
  }
}