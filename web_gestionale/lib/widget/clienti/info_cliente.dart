import 'package:flutter/material.dart';
import 'package:web_gestionale/bloc/clienti_screen_bloc.dart';
import 'package:web_gestionale/models/cliente_model.dart';
import 'package:web_gestionale/widget/badge.dart';

class InfoCliente extends StatefulWidget {
  @override
  _InfoClienteState createState() => _InfoClienteState();
}

class _InfoClienteState extends State<InfoCliente> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: blocClientiScreen.infoCliente,
        builder: (context, AsyncSnapshot<Cliente> snapshot) {
          return Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Image.network(
                    snapshot.data.imgPath,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.025,
                      horizontal: MediaQuery.of(context).size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        snapshot.data.nome,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.012),
                      ),
                      Text(
                        snapshot.data.email,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.007),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          snapshot.data.stato
                              ? Badge(
                                  coloreBtn: Colors.green,
                                  text: 'Accettato',
                                )
                              : Badge(
                                  coloreBtn: Colors.red,
                                  text: 'Bloccato',
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Badge(
                            coloreBtn: Colors.orange,
                            text: 'Alert',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        height: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text('Abbonamenti attivi',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.01)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Abbonamento 3 ingressi, scade il 29/10/2019',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.007)),
                          Text('Abbonamento 10 ingressi, scade il 29/10/2019',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.007)),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Iscrizioni attive',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.01)),
                          
                          Text('Iscrizione, scade il 29/10/2019',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.007))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
