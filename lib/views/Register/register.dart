import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/auth.dart';
import 'package:flutter_reduxx/redux/login/login_actions.dart';
import 'package:flutter_reduxx/redux/store.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zarejestruj się'),
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
                    labelText: 'Enter your username'
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
                    if (_formKey.currentState.validate()) print('valid');
                  },
                  color: Colors.pinkAccent,
                  
                  child: Text(
                    'ZAREJESTRUJ',
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