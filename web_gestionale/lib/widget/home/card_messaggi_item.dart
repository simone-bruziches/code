import 'package:flutter/material.dart';

class CardMessaggiItem extends StatelessWidget {
  String imgPath;
  String nome;
  String messaggio;
  String data;

  CardMessaggiItem(
      {@required this.imgPath,
      @required this.nome,
      @required this.messaggio,
      @required this.data});

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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              messaggio,
              overflow: TextOverflow.fade,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'SSC-Light',
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(data,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'SSC-Light',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
