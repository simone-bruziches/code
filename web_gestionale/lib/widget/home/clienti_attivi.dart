import 'package:flutter/material.dart';
import 'package:web_gestionale/icon_gestionale_icons.dart';

class ClientiAttivi extends StatefulWidget {
  @override
  _ClientiAttiviState createState() => _ClientiAttiviState();
}

class _ClientiAttiviState extends State<ClientiAttivi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.14,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Center(
                    child: Icon(
                      IconGestionale.users,
                      size: MediaQuery.of(context).size.height * 0.04,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Flexible(
                    flex: 7,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Clienti Attivi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('800',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.02,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '20%',
                                  style: TextStyle(color: Colors.green),
                                ),
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.green,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
