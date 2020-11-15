import 'package:flutter/material.dart';
import 'package:partnerweb3_mobile/model/ticket.dart';
import 'package:partnerweb3_mobile/screens/home/ticket_tile.dart';

class TicketList extends StatelessWidget {
  var _tickets;
  TicketList(this._tickets);

  List<Ticket> get tickets {
    return Ticket().mapTicketToTickets(this._tickets);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          return TicketTile(ticket: tickets[index]);
        });
  }
}
