import 'dart:convert';

import 'package:partnerweb3_mobile/model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TicketsManager {
  final User user;
  TicketsManager(this.user);

  Future getAssignedTickets() async{
    String url = 'http://10.0.2.2:8000/assigned_tickets';
    var response = await http.post(url, body: {
      'operator' : this.user.operator,
      'password' : this.user.password,
    });
    if (response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      var assignedTickets = jsonDecode(jsonResponse['assigned_tickets']);
      print(assignedTickets);
      return assignedTickets;
    }
  }
}