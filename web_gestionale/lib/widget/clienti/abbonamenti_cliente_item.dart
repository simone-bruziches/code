import 'package:flutter/material.dart';
import 'package:web_gestionale/models/abbonamento_cliente_model.dart';

class AbbonamentiClienteItem extends StatefulWidget {
  AbbonamentoCliente item;
  AbbonamentiClienteItem({this.item});
  @override
  _AbbonamentiClienteItemState createState() => _AbbonamentiClienteItemState();
}

class _AbbonamentiClienteItemState extends State<AbbonamentiClienteItem> {
  double sizeHeaderText = 0.007;
  double widthHeaderItem = 0.038;
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
              ),
              width: MediaQuery.of(context).size.width * widthHeaderItem,
              height: MediaQuery.of(context).size.height * heightHeaderItem,
              child: Center(
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
              child: Center(
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
              child: Center(
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
              child: Center(
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
              child: Center(
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
              child: Center(
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
              child: Center(
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
              child: Center(
                child:
                    getBadge(context, Colors.orange, 'Alert', sizeHeaderText),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              width: MediaQuery.of(context).size.width * widthHeaderItem,
              height: MediaQuery.of(context).size.height * heightHeaderItem,
              child: Center(child: get3Dots(context)),
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

  Widget get3Dots(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * 0.05,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.24),
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(5),
      child: Center(
        child: Icon(
          Icons.more_horiz,
        ),
      ),
    );
  }

  Widget getBadge(
      BuildContext context, Color coloreBtn, String text, double sizeText) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.05,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: coloreBtn.withOpacity(0.24),
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(5),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * sizeText,
              fontWeight: FontWeight.bold,
              color: coloreBtn),
        ),
      ),
    );
  }
}
