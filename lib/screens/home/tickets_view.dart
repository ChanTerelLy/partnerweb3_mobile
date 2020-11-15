import 'package:partnerweb3_mobile/model/user.dart';
import 'package:flutter/material.dart';
import 'package:partnerweb3_mobile/screens/home/ticket_list.dart';
import 'package:partnerweb3_mobile/services/config.dart';
import 'package:partnerweb3_mobile/services/tickets_manager.dart';
import 'package:partnerweb3_mobile/shared/loading.dart';
import 'package:provider/provider.dart';

class TicketsView extends StatefulWidget {
  Future type;

  TicketsView(this.type);

  @override
  _TicketsViewState createState() => _TicketsViewState();
}

class _TicketsViewState extends State<TicketsView> {
  @override
  Widget build(BuildContext context) {
    Future type;
    setState(() {
      type = widget.type;
    });
    return ticketsBuilder(type);
  }

  Widget ticketsBuilder(Future type) {
    return FutureBuilder(
        future: type,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Loading();
          } else if (snapshot.hasData) {
            return TicketList(snapshot.data);
          } else {
            return Loading();
          }
        });
  }
}
