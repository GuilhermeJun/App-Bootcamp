import 'package:flutter/material.dart';
import 'package:ps_bootcamp/screens/bootcamp_detalhes.dart';
import 'package:ps_bootcamp/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Bootcamp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/bootcamp_detalhes': (context) => BootcampDetalhesScreen(),
      },
    );
  }
}
