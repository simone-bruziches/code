import 'package:flutter/material.dart';
import 'package:web_gestionale/bloc/colonna_icone_navigation_bloc.dart';
import 'package:web_gestionale/screens/clienti_screen.dart';
import 'package:web_gestionale/widget/colonna_icone.dart';
import 'package:web_gestionale/widget/home/home_body.dart';
import 'package:web_gestionale/widget/home_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(height: height * 1, width: width * 1, child: getBody()),
    );
  }

  Widget getBody() {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ColonnaIcone(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                HomeBar(),
                StreamBuilder(
                    initialData: 0,
                    stream: blocScreenBody.screenBody,
                    builder: (context, AsyncSnapshot<int> snapshot) {
                      return snapshot.hasData
                          ? bodyScreen(snapshot.data)
                          : Text('Errore ricarica');
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bodyScreen(int page) {
    switch (page) {
      case 0:
        {
          return HomeBody();
        }
        break;

      case 1:
        {
          return HomeBody();
        }
        break;

      case 2:
        {
          return ClientiScreen();
        }
        break;

      default:
        {
          return HomeBody();
        }
        break;
    }
  }
}
