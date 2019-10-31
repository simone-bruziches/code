import 'package:flutter/material.dart';

class TableCheckInItem extends StatefulWidget {
  String imgPath;
  String nomeCliente;
  String orario;
  //Se abbonamento è TRUE mostra la spunta verde, altrimenti mostra la "X" rossa
  bool abbonamento;
  String attMedico;

  TableCheckInItem(
      {this.imgPath, this.nomeCliente, this.orario, this.abbonamento});
  @override
  _TableCheckInItemState createState() => _TableCheckInItemState();
}

class _TableCheckInItemState extends State<TableCheckInItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(color: Colors.grey, width: 0.5),
                          bottom: BorderSide(color: Colors.grey, width: 0.5))),
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01),
                  height: MediaQuery.of(context).size.height * 0.065,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.height * 0.025,
                            backgroundImage: NetworkImage(widget.imgPath),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Text(
                            widget.nomeCliente,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: 'SSC-Regular',
                            ),
                          )
                        ],
                      )),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.grey, width: 0.5),
                        bottom: BorderSide(color: Colors.grey, width: 0.5))),
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width * 0.08,
                child: Center(
                  child: Text(widget.orario,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.012)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.grey, width: 0.5),
                        bottom: BorderSide(color: Colors.grey, width: 0.5))),
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width * 0.08,
                child: Center(
                  child: Icon(
                    widget.abbonamento ? Icons.check : Icons.clear,
                    size: MediaQuery.of(context).size.width * 0.015,
                    color: widget.abbonamento ? Colors.green : Colors.red,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.grey, width: 0.5),
                        bottom: BorderSide(color: Colors.grey, width: 0.5))),
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width * 0.08,
                child: Center(
                  child: Text('',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.011)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Colors.grey, width: 0.5),
                        bottom: BorderSide(color: Colors.grey, width: 0.5))),
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width * 0.08,
                child: Center(
                  child: Text('',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.011)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5))),
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width * 0.08,
                child: Center(
                  child: Text('',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.011)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
