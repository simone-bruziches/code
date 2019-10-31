import 'package:flutter/material.dart';
import 'package:web_gestionale/icon_gestionale_icons.dart';

class NextCorsiListItem extends StatefulWidget {
  String imgPath;
  String nomeCorso;
  String nomeCorsista;
  int numeroSala;
  String orario;

  NextCorsiListItem(
      {@required this.imgPath,
      @required this.nomeCorso,
      @required this.nomeCorsista,
      @required this.numeroSala,
      @required this.orario});
  @override
  _NextCorsiListItemState createState() => _NextCorsiListItemState();
}

class _NextCorsiListItemState extends State<NextCorsiListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.01,
            top: MediaQuery.of(context).size.height * 0.01),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height * 0.03,
                  backgroundImage: NetworkImage(widget.imgPath),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.nomeCorso,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontFamily: 'SSC-Regular',
                          fontSize: MediaQuery.of(context).size.width * 0.011),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              IconGestionale.user_2,
                              size: MediaQuery.of(context).size.height * 0.02,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(widget.nomeCorsista,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'SSC-Light',
                                ))
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              IconGestionale.target,
                              size: MediaQuery.of(context).size.height * 0.02,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Sala ${widget.numeroSala}",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'SSC-Light',
                                ))
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              IconGestionale.clock,
                              size: MediaQuery.of(context).size.height * 0.02,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(widget.orario,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'SSC-Light',
                                ))
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 1),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    height: 20,
                    width: 20,
                    child: Center(child: Text('...')),
                  ),
                  SizedBox(height: 2.5),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    height: 20,
                    width: 20,
                    child: Center(child: Text('0')),
                  ),
                  SizedBox(height: 2.5),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    height: 20,
                    width: 20,
                    child: Center(child: Text('20')),
                  ),
                  SizedBox(height: 2.5),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    height: 20,
                    width: 20,
                    child: Center(child: Text('15')),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget getValue() {
    return Container();
  }
}
