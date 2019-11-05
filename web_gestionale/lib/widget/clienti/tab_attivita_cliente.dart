import 'package:flutter/material.dart';
import 'package:web_gestionale/widget/clienti/abbonamenti_cliente.dart';

class TabAttivitaCliente extends StatefulWidget {
  @override
  _TabAttivitaClienteState createState() => _TabAttivitaClienteState();
}

class _TabAttivitaClienteState extends State<TabAttivitaCliente>
    with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
}
