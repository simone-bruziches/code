import 'package:flutter/material.dart';
import 'package:web_gestionale/icon_gestionale_icons.dart';

class CardScadenzeItem extends StatefulWidget {
  String imgPath;
  String nome;
  String messaggio;
  String data;

  CardScadenzeItem(
      {@required this.imgPath,
      @required this.nome,
      @required this.messaggio,
      @required this.data});
  @override
  _CardScadenzeItemState createState() => _CardScadenzeItemState();
}

class _CardScadenzeItemState extends State<CardScadenzeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.03,
          backgroundImage: NetworkImage(widget.imgPath),
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          widget.nome,
          style: TextStyle(
            color: Colors.grey[700],
            fontFamily: 'SSC-Regular',
          ),
        ),
        subtitle: Text(
          widget.messaggio,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: Colors.grey,
            fontFamily: 'SSC-Light',
          ),
        ),
        trailing: Icon(IconGestionale.shopping_bag),
      ),
    );
  }
}
