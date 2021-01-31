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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["operator"] = this.operator;
    data["password"] = this.password;
    data["account_type"] = this.account_type;
    return data;
  }
}
