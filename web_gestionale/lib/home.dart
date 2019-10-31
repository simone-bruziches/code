import 'package:flutter/material.dart';
import 'package:web_gestionale/widget/colonna_icone.dart';
import 'package:web_gestionale/widget/home/clienti_attivi.dart';
import 'package:web_gestionale/widget/home_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(height: height * 1, width: width * 1, child: getBody()),
    );
  }

  Widget getBody() {
    return Stack(
      children: <Widget>[
        Container(
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.07),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    HomeBar(),
                    Container(
                      child: Row(
                        children: <Widget>[Column(), Column()],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            child: Container(
          child: ColonnaIcone(),
        )),
      ],
    );
  }
}
