import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ClientiScreen extends StatefulWidget {
  @override
  _ClientiScreenState createState() => _ClientiScreenState();
}

class _ClientiScreenState extends State<ClientiScreen> {
  bool short = false;
  double sizeTextTableItem = 0.009;

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
  Widget build(BuildContext context) {
    return Container(
      child: short == false ? getTableCheckIn() : getUserDetails(),
    );
  }

  /* Widget gette() {
    return  AnimationLimiter(
            child:
            Row(
              children: <Widget>[
                Container(
                  width: 1000,
                  child:
                 Row(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 250),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: [
                      getShortTable(),
                       secondBlocProva(),
                      thirdBlocProva(),
                    ],
                  ),
                ),),
              ],
            )
          );
  
  } */

  Widget getUserDetails() {
    return AnimationLimiter(
        child: Expanded(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                width: MediaQuery.of(context).size.width * 0.30,
                child: getShortTable(),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.46,
                child: secondBlocProva(),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.27,
                child: thirdBlocProva(),
              ),
            ],
          )),
    ));
  }

  Widget thirdBlocProva() {
    return Card(
      elevation: 4,
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 0.2,
      ),
    );
  }

  Widget secondBlocProva() {
    return Column(
      children: <Widget>[
        Card(
          elevation: 4,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
        ),
        Expanded(
          child: Card(
            elevation: 4,
            child: Container(),
          ),
        ),
      ],
    );
  }

  Widget getTableCheckIn() {
    return Expanded(
      child: Card(
        elevation: 4,
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
                            fontSize:
                                MediaQuery.of(context).size.width * 0.011)),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: double.infinity,
                    color: Colors.blue.withOpacity(0.1),
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Center(
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
                    child: Center(
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
                  child: Center(
                    child: Text('Stato',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.011)),
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.blue.withOpacity(0.1),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    child: Center(
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
                    child: Center(
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
                  child: Center(
                    child: Text('Alert',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.011)),
                  ),
                ),
                Container(
                  color: Colors.blue.withOpacity(0.1),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.08,
                  child: Center(
                    child: Text('Azioni',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.011)),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: liistaClienti.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            short = true;
                          });
                        },
                        child: getClienteItem(liistaClienti[index]),
                      );
                    })),
          ],
        ),
      ),
    );
  }

  Widget getShortTable() {
    return Card(
      elevation: 4,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                            setState(() {
                              short = false;
                            });
                          },
                          child: getListaItemShort2(
                              context, liistaClienti[index], sizeTextTableItem),
                        )),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getClienteItem(Cliente cliente) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.05,
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
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
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01),
          height: MediaQuery.of(context).size.height * 0.065,
          child: Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(cliente.imgPath),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
            height: MediaQuery.of(context).size.height * 0.065,
            width: double.infinity,
            child: Center(
              child: Text("${cliente.nome}",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width *
                          sizeTextTableItem)),
            ),
          ),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
            height: MediaQuery.of(context).size.height * 0.065,
            width: double.infinity,
            child: Center(
              child: Text("${cliente.email}",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width *
                          sizeTextTableItem)),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
          height: MediaQuery.of(context).size.height * 0.065,
          width: MediaQuery.of(context).size.width * 0.08,
          child: Center(
            child: cliente.stato
                ? getBadge(
                    context, Colors.green, 'Accettato', sizeTextTableItem)
                : getBadge(context, Colors.red, 'Bloccato', sizeTextTableItem),
          ),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
            height: MediaQuery.of(context).size.height * 0.065,
            width: double.infinity,
            child: SizedBox(
              child: Center(
                child: Text(cliente.messaggiDaLeggere,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.width *
                            sizeTextTableItem)),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
            height: MediaQuery.of(context).size.height * 0.065,
            width: double.infinity,
            child: Center(
              child: SizedBox(
                child: Text('${cliente.abbonamentiAttivi}',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: MediaQuery.of(context).size.width *
                            sizeTextTableItem)),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
          height: MediaQuery.of(context).size.height * 0.065,
          width: MediaQuery.of(context).size.width * 0.08,
          child: Center(
              child:
                  getBadge(context, Colors.orange, 'Alert', sizeTextTableItem)),
        ),
        Container(
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
          height: MediaQuery.of(context).size.height * 0.065,
          width: MediaQuery.of(context).size.width * 0.08,
          child: Center(
            child: get3Dots(context),
          ),
        ),
      ],
    );
  }
}

Widget get3Dots(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.height * 0.05,
    height: MediaQuery.of(context).size.height * 0.05,
    margin: EdgeInsets.all(10),
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

Widget getListaItemShort2(
    BuildContext context, Cliente cliente, double sizeText) {
  return Column(
    children: <Widget>[
      Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(cliente.imgPath),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          cliente.nome,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.01),
                        ),
                        Text(
                          cliente.email,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * sizeText),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    getBadge(context, cliente.stato ? Colors.green : Colors.red,
                        cliente.stato ? 'Accettato' : 'Bloccato', sizeText),
                    getBadge(context, Colors.orange, 'Alert', sizeText),
                    get3Dots(context)
                  ],
                ),
              )
            ],
          )),
      Container(
        margin: EdgeInsets.all(10),
        color: Colors.grey,
        height: 0.5,
      )
    ],
  );
}

class Cliente {
  String imgPath;
  String nome;
  String email;
  bool stato;

  String messaggiDaLeggere;
  String abbonamentiAttivi;
  bool alert;
  String azioni;

  Cliente(
      {this.imgPath,
      this.nome,
      this.email,
      this.stato,
      this.messaggiDaLeggere,
      this.abbonamentiAttivi,
      this.alert,
      this.azioni});
}
