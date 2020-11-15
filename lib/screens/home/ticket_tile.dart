import 'package:flutter/material.dart';
import 'package:partnerweb3_mobile/model/ticket.dart';

class TicketTile extends StatelessWidget {
  final Ticket ticket;


  TicketTile({this.ticket});


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ListTile(
            title: Text(ticket.name),
            subtitle: Text(ticket.address),
        ),
      ),
    );
  }
}
