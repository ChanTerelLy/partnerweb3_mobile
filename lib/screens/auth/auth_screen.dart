import 'package:flutter/material.dart';
import 'package:partnerweb3_mobile/services/auth.dart';
import 'package:partnerweb3_mobile/shared/constants.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // text field state
  String operator = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Partnerweb3'),
        backgroundColor: Colors.orange[400],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textFormDecoration.copyWith(hintText: 'Код сотрудника'),
                validator: (val) => val.isEmpty ? 'Заполните код сотрудника' : null,
                onChanged: (val) {
                  setState(() => operator = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textFormDecoration.copyWith(hintText: 'Пароль'),
                obscureText: true,
                validator: (val) => val.isEmpty ? 'Заполните пароль' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.black,
                  child: Text(
                    'Войти',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async{
                    bool result = await Auth().auth({'operator' : operator.toString(), 'password' : password.toString()});
                    if(result){
                      Navigator.pushNamed(context, '/tickets', arguments: {
                        'operator' : operator.toString(),
                        'password' : password.toString(),
                      });
                    }
                  },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
