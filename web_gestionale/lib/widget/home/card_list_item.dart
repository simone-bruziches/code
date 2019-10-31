import 'package:flutter/material.dart';

class CardListItem extends StatefulWidget {
  Widget icona;
  String titolo;
  String numero;
  //Solo il numero della percentuale
  double percentuale;
  //Se aumento è TRUE allora freccietta verde verso l'alto, altrimenti freccietta rossa verso il basso
  bool aumento;

  CardListItem(
      {@required this.icona,
      @required this.titolo,
      @required this.numero,
      @required this.percentuale,
      @required this.aumento});

  @override
  _CardListItemState createState() => _CardListItemState();
}

class _CardListItemState extends State<CardListItem> {
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
                child: widget.icona,
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
                      widget.titolo,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          child: Text(widget.numero,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.02,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${widget.percentuale}%',
                              style: TextStyle(
                                  color: widget.aumento
                                      ? Colors.green
                                      : Colors.red),
                            ),
                            widget.aumento
                                ? Icon(
                                    Icons.arrow_drop_up,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.red,
                                  )
                          ],
                        )
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
