import 'package:flutter/material.dart';

class Badge3Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        width: MediaQuery.of(context).size.height * 0.05,
        
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.24),
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.all(5),
        child: Center(
          child: Icon(
            Icons.more_horiz,
          ),
        ),
      ),
    );
  }
}
