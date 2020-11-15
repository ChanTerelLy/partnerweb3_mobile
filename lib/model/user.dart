import 'package:flutter/cupertino.dart';

class User {
  final String operator;
  final String password;
  final int account_type;

  User({
    @required this.operator,
    @required this.password,
    this.account_type
  });
}
