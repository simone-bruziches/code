import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_gestionale/icon_gestionale_icons.dart';

class HomeBar extends StatefulWidget {
  @override
  _HomeBarState createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.07,
      ),
      height: MediaQuery.of(context).size.height * 0.07,
      child: getBodyBar(context),
    );
  }

  Widget getBodyBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 8,
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                    IntrinsicWidth(
                      child: Text('Lunedi 30/10/2019',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.015)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.025,
                    ),
                    IntrinsicWidth(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: CupertinoTextField(
                          prefix: Icon(
                            Icons.search,
                            color: Theme.of(context).primaryColor,
                          ),
                          placeholderStyle: TextStyle(
                              fontFamily: 'SSC-Light', color: Colors.grey),
                          placeholder: 'Cerca Cliente',
                          style: TextStyle(
                              fontFamily: 'SSC-Light', color: Colors.black),
                          textCapitalization: TextCapitalization.words,
                          decoration: BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(10.0)),
                              border: Border.all(color: Colors.grey)),
                        ),
                      ),
                    )
                  ],
                ),
                Icon(
                  IconGestionale.alert,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01),
            color: Colors.grey,
            width: 1,
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height * 0.025,
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  IntrinsicWidth(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Shaggy Fitness',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.02),
                        ),
                        Text('Type something', style: TextStyle(color: Colors.grey[600], fontSize: MediaQuery.of(context).size.height * 0.015)),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
