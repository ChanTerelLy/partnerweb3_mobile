import 'package:flutter/material.dart';
import 'package:partnerweb3_mobile/screens/home/assigned_tickets.dart';

class HomeScreen extends StatefulWidget {
  final Map arguments;

  HomeScreen(this.arguments);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    print(widget.arguments);
    return Scaffold(
        body: AssignedTickets(widget.arguments),
        bottomNavigationBar: BottomNavigationBar(
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
}
