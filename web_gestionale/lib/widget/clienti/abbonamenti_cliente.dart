import 'package:flutter/material.dart';
import 'package:web_gestionale/bloc/clienti_screen_bloc.dart';
import 'package:web_gestionale/models/abbonamento_cliente_model.dart';
import 'package:web_gestionale/widget/clienti/abbonamenti_cliente_item.dart';

class AbbonamentiCliente extends StatefulWidget {
  @override
  _AbbonamentiClienteState createState() => _AbbonamentiClienteState();
}

class _AbbonamentiClienteState extends State<AbbonamentiCliente> {
  double sizeHeaderText = 0.007;
  double widthHeaderItem = 0.038;
  double heightHeaderItem = 0.06;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.005,
        right: MediaQuery.of(context).size.width * 0.005,
        top: MediaQuery.of(context).size.width * 0.005,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Colors.blue.withOpacity(0.1),
                ),
                width: MediaQuery.of(context).size.width * widthHeaderItem,
                height: MediaQuery.of(context).size.height * heightHeaderItem,
                child: Center(
                  child: SizedBox(
                    child: Text('Codice',
                        maxLines: 1,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width *
                                sizeHeaderText)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue.withOpacity(0.1),
                  height: MediaQuery.of(context).size.height * heightHeaderItem,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Nome',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width *
                                sizeHeaderText)),
                  ),
                ),
              ),
              Container(
                color: Colors.blue.withOpacity(0.1),
                width: MediaQuery.of(context).size.width * widthHeaderItem,
                height: MediaQuery.of(context).size.height * heightHeaderItem,
                child: Center(
                  child: SizedBox(
                    child: Text('Prezzo',
                        maxLines: 1,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width *
                                sizeHeaderText)),
                  ),
                ),
              ),
              Container(
                color: Colors.blue.withOpacity(0.1),
                width: MediaQuery.of(context).size.width * widthHeaderItem,
                height: MediaQuery.of(context).size.height * heightHeaderItem,
                child: Center(
                  child: SizedBox(
                    child: Text('Tipo Personal',
                        maxLines: 1,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width *
                                sizeHeaderText)),
                  ),
                ),
              ),
              Container(
                color: Colors.blue.withOpacity(0.1),
                width: MediaQuery.of(context).size.width * widthHeaderItem,
                height: MediaQuery.of(context).size.height * heightHeaderItem,
                child: Center(
                  child: SizedBox(
                    child: Text('di Prova',
                        maxLines: 1,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width *
                                sizeHeaderText)),
                  ),
                ),
              ),
              Container(
                color: Colors.blue.withOpacity(0.1),
                width: MediaQuery.of(context).size.width * widthHeaderItem,
                height: MediaQuery.of(context).size.height * heightHeaderItem,
                child: Center(
                  child: Text('Data inizio',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width *
                              sizeHeaderText)),
                ),
              ),
              Container(
                color: Colors.blue.withOpacity(0.1),
                width: MediaQuery.of(context).size.width * widthHeaderItem,
                height: MediaQuery.of(context).size.height * heightHeaderItem,
                child: Center(
                  child: Text('Data fine',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width *
                              sizeHeaderText)),
                ),
              ),
              Container(
                color: Colors.blue.withOpacity(0.1),
                width: MediaQuery.of(context).size.width * widthHeaderItem,
                height: MediaQuery.of(context).size.height * heightHeaderItem,
                child: Center(
                  child: Text('Bloccato',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width *
                              sizeHeaderText)),
                ),
              ),
              Container(
                color: Colors.blue.withOpacity(0.1),
                width: MediaQuery.of(context).size.width * widthHeaderItem,
                height: MediaQuery.of(context).size.height * heightHeaderItem,
                child: Center(
                  child: Text('Alert',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width *
                              sizeHeaderText)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                width: MediaQuery.of(context).size.width * widthHeaderItem,
                height: MediaQuery.of(context).size.height * heightHeaderItem,
                child: Center(
                  child: Text('Azioni',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width *
                              sizeHeaderText)),
                ),
              ),
            ],
          ),
          StreamBuilder(
              stream: blocClientiScreen.listaAbbonamentiCliente,
              builder:
                  (context, AsyncSnapshot<List<AbbonamentoCliente>> snapshot) {
                return snapshot.hasData
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return AbbonamentiClienteItem(
                                  item: snapshot.data[index]);
                            }),
                      )
                    : Center(child: CircularProgressIndicator());
              })
        ],
      ),
    );
  }
}
