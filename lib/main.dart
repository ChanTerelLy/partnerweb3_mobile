import 'package:flutter/material.dart';
import 'package:partnerweb3_mobile/screens/auth/auth_screen.dart';
import 'screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => AuthScreen(),
        '/tickets': (context) => HomeScreen(ModalRoute.of(context).settings.arguments),
      },
    );
  }
}