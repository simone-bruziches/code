import 'package:flutter/material.dart';
import 'package:web_gestionale/models/cliente_model.dart';
import 'package:web_gestionale/screens/clienti_screen.dart';
import 'package:web_gestionale/widget/badge.dart';
import 'package:web_gestionale/widget/badge_3_dots.dart';

class ListaCortaClientiItem extends StatefulWidget {
  Cliente cliente;
  double sizeText;

  ListaCortaClientiItem({@required this.cliente, @required this.sizeText});
  @override
  _ListaCortaClientiItemState createState() => _ListaCortaClientiItemState();
}

class _ListaCortaClientiItemState extends State<ListaCortaClientiItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 4,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.cliente.imgPath),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.cliente.nome,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.01),
                          ),
                          Text(
                            widget.cliente.email,
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width *
                                    widget.sizeText),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Badge(
                        coloreBtn:
                            widget.cliente.stato ? Colors.green : Colors.red,
                        text: widget.cliente.stato ? 'Accettato' : 'Bloccato',
                      ),
                      Badge(coloreBtn: Colors.orange, text: 'Alert'),
                      Badge3Dots()
                    ],
                  ),
                )
              ],
            )),
        Container(
          margin: EdgeInsets.all(10),
          color: Colors.grey,
          height: 0.5,
        )
      ],
    );
  }
}
