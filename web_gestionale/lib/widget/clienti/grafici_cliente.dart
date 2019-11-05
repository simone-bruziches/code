import 'package:flutter/material.dart';
import 'package:web_gestionale/widget/clienti/grafico_prenotazioni_mese.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:web_gestionale/widget/clienti/grafico_ricavo_annuo.dart';

class GraficiCliente extends StatefulWidget {
  @override
  _GraficiClienteState createState() => _GraficiClienteState();
}

class _GraficiClienteState extends State<GraficiCliente> {
  double sizeText2 = 0.007;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
            elevation: 4,
            child: Container(
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          getPrenotazioniMese(),
                          Expanded(
                              child: GraficoPrenotazioneMese(
                            animate: true,
                          ))
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          getRicaviAnnui(),
                          Expanded(
                              child: GraficoRicavoAnnuo(
                            animate: true,
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),

              /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Ricavi annui',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: MediaQuery.of(context).size.width *
                                    sizeText2),
                          ),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text('€ 350',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        color: Theme.of(context).primaryColor)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '20%',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.008,
                                    color: Colors.green),
                              ),
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.green,
                                size: MediaQuery.of(context).size.width * 0.008,
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Ultima prenotazione',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: MediaQuery.of(context).size.width *
                                    sizeText2),
                          ),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text('29/10/2019',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        color: Theme.of(context).primaryColor)),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Ricavi annui',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: MediaQuery.of(context).size.width *
                                    sizeText2),
                          ),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text('€ 350',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                        color: Theme.of(context).primaryColor)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '20%',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.008,
                                    color: Colors.green),
                              ),
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.green,
                                size: MediaQuery.of(context).size.width * 0.008,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ) */
            )));
  }

  Widget getPrenotazioniMese() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'Pren. mese',
          style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).size.width * sizeText2),
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text('35',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.02,
                      color: Theme.of(context).primaryColor)),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '20%',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.008,
                  color: Colors.red),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.red,
              size: MediaQuery.of(context).size.width * 0.008,
            )
          ],
        )
      ],
    );
  }

  Widget getRicaviAnnui() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          'Ricavi annui',
          style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).size.width * sizeText2),
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text('€ 350',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.02,
                      color: Theme.of(context).primaryColor)),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '20%',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.008,
                  color: Colors.green),
            ),
            Icon(
              Icons.arrow_drop_up,
              color: Colors.green,
              size: MediaQuery.of(context).size.width * 0.008,
            )
          ],
        )
      ],
    );
  }

  Widget getUltimaPrenotazione() {}
}
