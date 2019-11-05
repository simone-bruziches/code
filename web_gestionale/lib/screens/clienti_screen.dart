import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:web_gestionale/bloc/clienti_screen_bloc.dart';
import 'package:web_gestionale/models/cliente_model.dart';
import 'package:web_gestionale/widget/clienti/abbonamenti_cliente.dart';
import 'package:web_gestionale/widget/clienti/info_cliente.dart';
import 'package:web_gestionale/widget/clienti/lista_corta_clienti.dart';

class ClientiScreen extends StatefulWidget {
  @override
  _ClientiScreenState createState() => _ClientiScreenState();
}

class _ClientiScreenState extends State<ClientiScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  bool short = false;
  double sizeTextTableItem = 0.009;
  double sizeText2 = 0.007;

  List<Cliente> liistaClienti = [
    Cliente(
        imgPath:
            'https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
        nome: 'simone bruziches',
        email: 'simi@gmail.com',
        stato: true,
        messaggiDaLeggere: 'nessuno',
        abbonamentiAttivi: 'Abbonamento - scade il 13/11/2019',
        alert: false,
        azioni: 'Scegli azione'),
    Cliente(
        imgPath:
            'https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
        nome: 'marco rossi',
        email: 'simi@gmail.com',
        stato: false,
        messaggiDaLeggere: 'nessuno',
        abbonamentiAttivi: 'Abbonamento - scade il 13/11/2019',
        alert: false,
        azioni: 'Scegli azione'),
    Cliente(
        imgPath:
            'https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
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
    _tabController = new TabController(length: 5, vsync: this);
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
        StreamBuilder(
            stream: blocClientiScreen.infoCliente,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Card(
                      elevation: 4,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.26,
                        margin: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(snapshot.data.imgPath),
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.01,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data.nome,
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.012),
                                        ),
                                        Text(
                                          snapshot.data.email,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  sizeTextTableItem),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    //Qui ci vanno le icone
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  flex: 5,
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Abbonamenti attivi',
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                              'Abbonamento 3 ingressi, scade il 29/10/2019',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          sizeText2)),
                                          Text(
                                              'Abbonamento 10 ingressi, scade il 29/10/2019',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          sizeText2)),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 5,
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Iscrizioni attive',
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01)),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      Text('Iscrizione, scade il 29/10/2019',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  sizeText2))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'Pren. mese',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              sizeText2),
                                    ),
                                    Row(
                                      textBaseline: TextBaseline.alphabetic,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text('35',
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '20%',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.008,
                                              color: Colors.red),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.red,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.008,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'Ricavi annui',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              sizeText2),
                                    ),
                                    Row(
                                      textBaseline: TextBaseline.alphabetic,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text('€ 350',
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '20%',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.008,
                                              color: Colors.green),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_up,
                                          color: Colors.green,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.008,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'Ultima prenotazione',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              sizeText2),
                                    ),
                                    Row(
                                      textBaseline: TextBaseline.alphabetic,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text('29/10/2019',
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'Ricavi annui',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              sizeText2),
                                    ),
                                    Row(
                                      textBaseline: TextBaseline.alphabetic,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text('€ 350',
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.02,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '20%',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.008,
                                              color: Colors.green),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_up,
                                          color: Colors.green,
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.008,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : Text('Nessun utente selezionato');
            }),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        TabBar(
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.01),
          unselectedLabelColor: Colors.grey,
          labelColor: Theme.of(context).primaryColor,
          indicatorColor: Theme.of(context).primaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              text: 'Abbonamenti',
            ),
            Tab(
              text: 'Iscrizioni',
            ),
            Tab(
              text: 'Prenotazioni',
            ),
            Tab(
              text: 'Acquisti',
            ),
            Tab(
              text: 'Pagamenti',
            ),
          ],
          controller: _tabController,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        Expanded(
          child: Card(
            elevation: 4,
            child: Container(
              child: TabBarView(
                children: [
                  AbbonamentiCliente(),
                  Text("This is call Tab View"),
                  Text("This is call Tab View"),
                  Text("This is chat Tab View"),
                  Text("This is notification Tab View"),
                ],
                controller: _tabController,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getTableCheckIn() {
    return Card(
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
                          fontSize: MediaQuery.of(context).size.width * 0.011)),
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
                          fontSize: MediaQuery.of(context).size.width * 0.011)),
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
                          fontSize: MediaQuery.of(context).size.width * 0.011)),
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
                          fontSize: MediaQuery.of(context).size.width * 0.011)),
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
                        blocClientiScreen.changeListaLenght(true);
                        blocClientiScreen
                            .changeInfoCliente(liistaClienti[index]);
                      },
                      child: getClienteItem(liistaClienti[index]),
                    );
                  })),
        ],
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
