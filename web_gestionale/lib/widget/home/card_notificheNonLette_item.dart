import 'package:flutter/material.dart';
import 'package:web_gestionale/icon_gestionale_icons.dart';

class CardNotificheNonLetteItem extends StatelessWidget {
  String messaggio;

  CardNotificheNonLetteItem({
    @required this.messaggio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text(
            
            messaggio,
            style: TextStyle(
              color: Colors.grey[700],
              fontFamily: 'SSC-Regular',
            ),
          ),
          trailing: Icon(IconGestionale.information,
              color: Theme.of(context).primaryColor, size: 20)),
    );
  }
}
