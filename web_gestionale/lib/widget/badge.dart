import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  Color coloreBtn;
  String text;
  Badge({this.coloreBtn, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: coloreBtn.withOpacity(0.24),
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: coloreBtn),
        ),
      ),
    );
  }
}
