import 'package:partnerweb3_mobile/model/user.dart';
import 'package:flutter/material.dart';
import 'package:partnerweb3_mobile/screens/home/ticket_list.dart';
import 'package:partnerweb3_mobile/services/config.dart';
import 'package:partnerweb3_mobile/services/tickets_manager.dart';
import 'package:provider/provider.dart';

class AssignedTickets extends StatefulWidget {
  final Map arguments;
  AssignedTickets(this.arguments);
  @override
  _AssignedTicketsState createState() => _AssignedTicketsState();
}

class _AssignedTicketsState extends State<AssignedTickets> {
  @override
  Widget build(BuildContext context) {
    final User user = User(operator: widget.arguments['operator'], password: widget.arguments['password']);
    return FutureBuilder(
        future: TicketsManager(user).getAssignedTickets(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return TicketList(snapshot.data);
          } else {
            return Container();
          }
        });
  }
}
