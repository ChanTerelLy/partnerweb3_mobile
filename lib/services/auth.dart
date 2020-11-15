import 'dart:convert' as convert;
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:http/http.dart' as http;
import 'package:partnerweb3_mobile/services/config.dart';
import 'package:partnerweb3_mobile/services/database.dart';

class Auth {


  Future auth(Map arguments) async {
    var url = 'http://10.0.2.2:8000/api_login';
    var response = await http.post(url, body: arguments);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      if(jsonResponse['success']){
        int account_type = jsonResponse['account_type'];
        DatabaseService(operator: arguments['operator']).createOrUpdateUser(
            arguments['operator'], arguments['password'], account_type);
      }
      print('new User add');
      return true;

    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
  }

}