import 'package:flutter/material.dart';
import 'package:web_gestionale/bloc/home_dati_bloc.dart';
import 'package:web_gestionale/icon_gestionale_icons.dart';
import 'package:web_gestionale/models/dati_home_model.dart';

class CardNumeroProve extends StatefulWidget {
  @override
  _CardNumeroProveState createState() => _CardNumeroProveState();
}

class _CardNumeroProveState extends State<CardNumeroProve> {
  @override
  void initState() {
    blocHomeDati.getNumeroProve();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: blocHomeDati.numeroProve,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            ));
          } else {
            return FutureBuilder<DatiHome>(
              future: snapshot.data,
              builder: (context, snap) {
                return CardNumeroProveItem(dati: snap.data);
              },
            );
          }
        });
  }
}

class CardNumeroProveItem extends StatelessWidget {
  DatiHome dati;
  CardNumeroProveItem({this.dati});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 1,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.12,
        height: MediaQuery.of(context).size.height * 0.15,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Center(
                child: Icon(
                  IconGestionale.open_book,
                  size: MediaQuery.of(context).size.height * 0.04,
                  color: Colors.grey,
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
                      'Numero prove',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    ),
                    (dati != null)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                child: Text(dati.numero,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold)),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '${dati.percentuale}%',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        color: dati.aumento
                                            ? Colors.green
                                            : Colors.red),
                                  ),
                                  dati.aumento
                                      ? Icon(
                                          Icons.arrow_drop_up,
                                          color: Colors.green,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        )
                                      : Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.red,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        )
                                ],
                              )
                            ],
                          )
                        : CircularProgressIndicator(
                            backgroundColor: Theme.of(context).primaryColor,
                          )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
