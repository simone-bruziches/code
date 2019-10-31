import 'package:flutter/material.dart';

class CertMediciListItem extends StatefulWidget {
  String imgPath;
  String nome;
  String messaggio;
  String data;

  CertMediciListItem(
      {@required this.imgPath,
      @required this.nome,
      @required this.messaggio,
      @required this.data});
  @override
  _CertMediciListItemState createState() => _CertMediciListItemState();
}

class _CertMediciListItemState extends State<CertMediciListItem> {
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
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(widget.data,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'SSC-Light',
                )),
          ],
        ),
      ),
    );
  }
}
