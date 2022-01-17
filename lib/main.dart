import 'package:festival_application/pages/home.dart';
import 'package:festival_application/pages/listEvents.dart';
import 'package:festival_application/pages/listUsers.dart';
import 'package:festival_application/pages/login.dart';
import 'package:festival_application/pages/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Festival App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Test(),
    );
  }
}