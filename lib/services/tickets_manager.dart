import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:partnerweb3_mobile/model/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'config.dart';

class TicketsManager {
  final User user;
  TicketsManager(this.user);

  Future<RemoteConfig> get config async{
    return await Config().getRemoteConfig();
  }

  Future getAssignedTickets() async{
    RemoteConfig conf = await this.config;
    String url = conf.getString('host') + '/assigned_tickets';
    var response = await http.post(url, body: {
      'operator' : this.user.operator,
      'password' : this.user.password,
    });
    if (response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      var tickets = jsonDecode(jsonResponse['assigned_tickets']);
      return tickets;
    }
  }

  Future getSwitchedTickets() async{
    RemoteConfig conf = await this.config;
    String url = conf.getString('host') + '/switched_tickets';
    var response = await http.post(url, body: {
      'operator' : this.user.operator,
      'password' : this.user.password,
    });
    if (response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      var tickets = jsonDecode(jsonResponse['tickets']);
      return tickets;
    }
  }

  Future getCallTodayTickets() async{
    RemoteConfig conf = await this.config;
    String url = conf.getString('host') + '/call_today_tickets';
    var response = await http.post(url, body: {
      'operator' : this.user.operator,
      'password' : this.user.password,
    });
    if (response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      var tickets = jsonDecode(jsonResponse['tickets']);
      return tickets;
    }
  }
}