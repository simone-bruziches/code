import 'package:flutter/material.dart';
import 'package:web_gestionale/models/abbonamento_cliente_model.dart';
import 'package:web_gestionale/widget/badge.dart';
import 'package:web_gestionale/widget/badge_3_dots.dart';

class AbbonamentiClienteItem extends StatefulWidget {
  AbbonamentoCliente item;
  AbbonamentiClienteItem({this.item});
  @override
  _AbbonamentiClienteItemState createState() => _AbbonamentiClienteItemState();
}

class _AbbonamentiClienteItemState extends State<AbbonamentiClienteItem> {
  double sizeHeaderText = 0.007;
  double widthHeaderItem = 0.045;
  double heightHeaderItem = 0.06;
  Color colorTextItem = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
              ),
              width: MediaQuery.of(context).size.width * widthHeaderItem,
              height: MediaQuery.of(context).size.height * heightHeaderItem,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Text(widget.item.codice,
                      maxLines: 1,
                      style: TextStyle(
                          color: colorTextItem,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width *
                              sizeHeaderText)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * heightHeaderItem,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: Text(widget.item.nome,
                        maxLines: 1,
                        style: TextStyle(
                            color: colorTextItem,
                            fontSize: MediaQuery.of(context).size.width *
                                sizeHeaderText)),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * widthHeaderItem,
              height: MediaQuery.of(context).size.height * heightHeaderItem,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Text(widget.item.prezzo,
                      maxLines: 1,
                      style: TextStyle(
                          color: colorTextItem,
                          fontSize: MediaQuery.of(context).size.width *
                              sizeHeaderText)),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * widthHeaderItem,
              height: MediaQuery.of(context).size.height * heightHeaderItem,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Text(widget.item.tipoPersonal ? 'Si' : 'No',
                      maxLines: 1,
                      style: TextStyle(
                          color: colorTextItem,
                          fontSize: MediaQuery.of(context).size.width *
                              sizeHeaderText)),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * widthHeaderItem,
              height: MediaQuery.of(context).size.height * heightHeaderItem,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Text(widget.item.diProva ? 'Si' : 'No',
                      maxLines: 1,
                      style: TextStyle(
                          color: colorTextItem,
                          fontSize: MediaQuery.of(context).size.width *
                              sizeHeaderText)),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * widthHeaderItem,
              height: MediaQuery.of(context).size.height * heightHeaderItem,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.item.dataInizio,
                    style: TextStyle(
                        color: colorTextItem,
                        fontSize: MediaQuery.of(context).size.width *
                            sizeHeaderText)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * widthHeaderItem,
              height: MediaQuery.of(context).size.height * heightHeaderItem,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.item.dataFine,
                    style: TextStyle(
                        color: colorTextItem,
                        fontSize: MediaQuery.of(context).size.width *
                            sizeHeaderText)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * widthHeaderItem,
              height: MediaQuery.of(context).size.height * heightHeaderItem,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.item.bloccato ? "Si" : "No",
                    style: TextStyle(
                        color: colorTextItem,
                        fontSize: MediaQuery.of(context).size.width *
                            sizeHeaderText)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * widthHeaderItem,
              height: MediaQuery.of(context).size.height * heightHeaderItem,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Badge(coloreBtn: Colors.orange, text: 'Alert'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              width: MediaQuery.of(context).size.width * widthHeaderItem,
              height: MediaQuery.of(context).size.height * heightHeaderItem,
              child:
                  Align(alignment: Alignment.centerLeft, child: Badge3Dots()),
            ),
          ],
        ),
        Container(
          height: 0.5,
          color: Colors.grey,
        )
      ],
    );
  }
}
