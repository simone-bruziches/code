import 'package:flutter/material.dart';
import 'package:web_gestionale/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'SSC-Medium',
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
