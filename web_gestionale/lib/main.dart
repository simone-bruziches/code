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
          backgroundColor: Colors.grey[50],
          primaryColor: Color(0Xff285575)),
      home: Home(),
    );
  }
}
