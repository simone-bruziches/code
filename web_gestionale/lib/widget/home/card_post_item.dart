import 'package:flutter/material.dart';
import 'package:web_gestionale/icon_gestionale_icons.dart';

class CardPostItem extends StatelessWidget {
  String imgPath;
  String nome;
  String messaggio;

  CardPostItem(
      {@required this.imgPath,
      @required this.nome,
      @required this.messaggio,
      });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.03,
          backgroundImage: NetworkImage(imgPath),
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          nome,
          style: TextStyle(
            color: Colors.grey[700],
            fontFamily: 'SSC-Regular',
          ),
        ),
        subtitle: Text(
          messaggio,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: Colors.grey,
            fontFamily: 'SSC-Light',
          ),
        ),
        trailing: Icon(IconGestionale.pencil, color: Colors.grey, size: 20,),
      ),
    );
  }
}
