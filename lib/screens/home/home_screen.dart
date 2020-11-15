import 'package:flutter/material.dart';
import 'package:partnerweb3_mobile/model/user.dart';
import 'package:partnerweb3_mobile/screens/home/tickets_view.dart';
import 'package:partnerweb3_mobile/services/tickets_manager.dart';

class HomeScreen extends StatefulWidget {
  final Map arguments;
  HomeScreen(this.arguments);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  Widget ticketsView;
  @override
  Widget build(BuildContext context) {
    _getBody(index);
    return Scaffold(
        body: ticketsView,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) => setState(() {
            index = value;
            _getBody(index);
          }),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_outlined),
              label: 'Назначенные',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Перезвоны',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in_outlined),
              label: 'Подключенные',
            ),
          ],
        ));
  }

  Future ticketsType(int index) async {
    final User user = User(operator: widget.arguments['operator'], password: widget.arguments['password']);
    switch (index) {
      case 0:
        return await TicketsManager(user).getAssignedTickets();
      case 1:
        return await TicketsManager(user).getCallTodayTickets();
      case 2:
        return await TicketsManager(user).getSwitchedTickets();
    }
  }
  void _getBody(int index) {
    setState(() {
      ticketsView = TicketsView(ticketsType(index));
    });
  }
}
