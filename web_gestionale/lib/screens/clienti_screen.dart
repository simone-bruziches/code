import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:web_gestionale/bloc/clienti_screen_bloc.dart';
import 'package:web_gestionale/models/cliente_model.dart';
import 'package:web_gestionale/widget/badge.dart';
import 'package:web_gestionale/widget/clienti/grafici_cliente.dart';
import 'package:web_gestionale/widget/clienti/info_cliente.dart';
import 'package:web_gestionale/widget/clienti/tab_attivita_cliente.dart';

class ClientiScreen extends StatefulWidget {
  @override
  _ClientiScreenState createState() => _ClientiScreenState();
}

class _ClientiScreenState extends State<ClientiScreen> {
  bool short = false;
  double sizeTextTableItem = 0.009;
  double sizeText2 = 0.007;
  Color colorText = Colors.black;

  List<Cliente> liistaClienti = [
    Cliente(
        imgPath:
            'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
        nome: 'simone bruziches',
        email: 'simi@gmail.com',
        stato: true,
        messaggiDaLeggere: 'nessuno',
        abbonamentiAttivi: 'Abbonamento - scade il 13/11/2019',
        alert: false,
        azioni: 'Scegli azione'),
    Cliente(
        imgPath:
            'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
        nome: 'marco rossi',
        email: 'simi@gmail.com',
        stato: false,
        messaggiDaLeggere: 'nessuno',
        abbonamentiAttivi: 'Abbonamento - scade il 13/11/2019',
        alert: false,
        azioni: 'Scegli azione'),
    Cliente(
        imgPath:
            'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
        nome: 'silvano lippi',
        email: 'simi@gmail.com',
        stato: true,
        messaggiDaLeggere: 'nessuno',
        abbonamentiAttivi: 'Abbonamento - scade il 13/11/2019',
        alert: false,
        azioni: 'Scegli azione'),
  ];

  @override
  void initState() {
    blocClientiScreen.changeListaLenght(false);
    blocClientiScreen.getListaClienti();
    blocClientiScreen.getListaAbbonamentiCliente();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: blocClientiScreen.listaLenght,
      initialData: false,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Expanded(
                child: snapshot.data == false
                    ? getTableCheckIn()
                    : getUserDetails(),
              )
            : Text('Errore Stream');
      },
    );
  }

  Widget getUserDetails() {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width -
          MediaQuery.of(context).size.height * 0.07,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            child: InkWell(
              onTap: () {
                blocClientiScreen.changeListaLenght(false);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.arrow_back_ios,
                      color: Theme.of(context).primaryColor,
                      size: MediaQuery.of(context).size.height * 0.03),
                  Text('indietro',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: MediaQuery.of(context).size.width *
                              sizeTextTableItem))
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 1000),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 250.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2 - 40,
                    child: InfoCliente(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.height * 0.07 -
                        MediaQuery.of(context).size.width * 0.45,
                    child: secondBlocProva(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: thirdBlocProva(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget thirdBlocProva() {
    return Card(
      elevation: 4,
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
      ),
    );
  }

  Widget secondBlocProva() {
    return Column(
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: TabAttivitaCliente()),
        GraficiCliente()
      ],
    );
  }

  Widget getTableCheckIn() {
    return Card(
      margin: EdgeInsets.all(40),
      elevation: 2,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.05,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01),
                color: Colors.blue.withOpacity(0.1),
                height: MediaQuery.of(context).size.height * 0.06,
                child: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.05,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01),
                color: Colors.blue.withOpacity(0.1),
                height: MediaQuery.of(context).size.height * 0.06,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Foto',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.011)),
                ),
              ),
              Flexible(
                child: Container(
                  width: double.infinity,
                  color: Colors.blue.withOpacity(0.1),
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Nome',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.011)),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.blue.withOpacity(0.1),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Email',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.011)),
                  ),
                ),
              ),
              Container(
                color: Colors.blue.withOpacity(0.1),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.08,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Stato',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.011)),
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.blue.withOpacity(0.1),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Messaggi da leggere',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.011)),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.blue.withOpacity(0.1),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Abbonamenti attivi',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.011)),
                  ),
                ),
              ),
              Container(
                color: Colors.blue.withOpacity(0.1),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.08,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Alert',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.011)),
                ),
              ),
              Container(
                color: Colors.blue.withOpacity(0.1),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.08,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Azioni',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.011)),
                ),
              ),
            ],
          ),
          Expanded(
              child: AnimationLimiter(
            child: ListView.builder(
              itemCount: liistaClienti.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                        child: InkWell(
                      onTap: () {
                        blocClientiScreen.changeListaLenght(true);
                        blocClientiScreen
                            .changeInfoCliente(liistaClienti[index]);
                      },
                      child: getClienteItem(liistaClienti[index]),
                    )),
                  ),
                );
              },
            ),
          )),
        ],
      ),
    );
  }

  Widget getClienteItem(Cliente cliente) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.05,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01),
              height: MediaQuery.of(context).size.height * 0.065,
              child: Center(
                  child: Checkbox(
                value: false,
                onChanged: (value) {},
              )),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.05,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.01),
              height: MediaQuery.of(context).size.height * 0.065,
              child: Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(cliente.imgPath),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("${cliente.nome}",
                      style: TextStyle(
                          color: colorText,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width *
                              sizeTextTableItem)),
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("${cliente.email}",
                      style: TextStyle(
                          color: colorText,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width *
                              sizeTextTableItem)),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width * 0.08,
              child: Align(
                alignment: Alignment.centerLeft,
                child: cliente.stato
                    ? Badge(coloreBtn: Colors.green, text: 'Accettato')
                    : Badge(coloreBtn: Colors.red, text: 'Bloccato'),
              ),
            ),
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: double.infinity,
                child: SizedBox(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(cliente.messaggiDaLeggere,
                        style: TextStyle(
                            color: colorText,
                            fontSize: MediaQuery.of(context).size.width *
                                sizeTextTableItem)),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: Text('${cliente.abbonamentiAttivi}',
                        style: TextStyle(
                            color: colorText,
                            fontSize: MediaQuery.of(context).size.width *
                                sizeTextTableItem)),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width * 0.08,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Badge(coloreBtn: Colors.orange, text: 'Alert')),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width * 0.08,
              child: Align(
                alignment: Alignment.centerLeft,
                child: get3Dots(context),
              ),
            ),
          ],
        ),
        Container(width: double.infinity, height: 0.5, color: Colors.grey[300], margin: EdgeInsets.symmetric(horizontal: 40),)
      ],
    );
  }
}

Widget get3Dots(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.height * 0.05,
    height: MediaQuery.of(context).size.height * 0.05,
    decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.24),
        borderRadius: BorderRadius.circular(5)),
    padding: EdgeInsets.all(5),
    child: Center(
      child: Icon(
        Icons.more_horiz,
      ),
    ),
  );
}

Widget getBadge(
    BuildContext context, Color coloreBtn, String text, double sizeText) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.05,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: coloreBtn.withOpacity(0.24),
        borderRadius: BorderRadius.circular(5)),
    padding: EdgeInsets.all(5),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * sizeText,
            fontWeight: FontWeight.bold,
            color: coloreBtn),
      ),
    ),
  );
}

Widget getListaItemShort(
    BuildContext context, Cliente cliente, double sizeText) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: ListTile(
      leading: CircleAvatar(
        radius: MediaQuery.of(context).size.height * 0.025,
        backgroundImage: NetworkImage(cliente.imgPath),
        backgroundColor: Colors.transparent,
      ),
      title: Text(cliente.nome),
      subtitle: Text(cliente.email),
      trailing: Container(
        color: Colors.grey,
        width: MediaQuery.of(context).size.width * 0.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            getBadge(context, cliente.stato ? Colors.green : Colors.red,
                cliente.stato ? 'Accettato' : 'Bloccato', sizeText),
            getBadge(context, Colors.orange, 'Alert', sizeText),
            get3Dots(context)
          ],
        ),
      ),
    ),
  );
}
