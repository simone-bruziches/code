import 'package:flutter/material.dart';
import 'package:web_gestionale/bloc/colonna_icone_navigation_bloc.dart';
import 'package:web_gestionale/icon_gestionale_icons.dart';
import 'package:web_gestionale/screens/clienti_screen.dart';

class ColonnaIcone extends StatefulWidget {
  @override
  _ColonnaIconeState createState() => _ColonnaIconeState();
}

class _ColonnaIconeState extends State<ColonnaIcone>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorTween;

  void animationGo() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _colorTween = ColorTween(
            begin: Colors.black.withOpacity(0),
            end: Colors.black.withOpacity(1))
        .animate(_animationController);
  }

  bool testoIconaVisibile = false;
  double width = 0.0;
  bool menuAperto = false;
  double larghezzaColonnaicone = 0.07;
  /* List<String> sezioni = [
    'Home',
    'Informazioni palestra',
    'Clienti',
    'Abbonamenti',
    'WOD',
    'Palinsesto',
    'Prenotazioni',
    'Agenda',
    'Acquisti',
    'Settings',
    'Logout',
    'Statistiche',
    'Shopping',
  ]; */
  @override
  void initState() {
    animationGo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getGufo(),
        Column(
          children: <Widget>[
            getIcona(false, IconGestionale.home, context, 'Home', false,
                blocScreenBody.getHomeScreen),
            getIcona(false, IconGestionale.information, context,
                'Informazioni palestra', false, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClientiScreen()),
              );
            }),
            getIcona(false, IconGestionale.users, context, 'Clienti', false,
                blocScreenBody.getClientiScreen),
            getIcona(false, IconGestionale.layout_1, context, 'Abbonamenti',
                false, () {}),
            getIcona(false, IconGestionale.kettlebell, context, 'Wuod', false,
                () {}),
            getIcona(false, IconGestionale.calendar, context, 'Palinsesto',
                false, () {}),
            getIcona(false, Icons.add, context, 'Prenotazioni', false, () {}),
            getIcona(false, IconGestionale.open_book, context, 'Agenda', false,
                () {}),
            getIcona(false, IconGestionale.bookmark, context, 'Acquisti', false,
                () {}),
            getIcona(false, IconGestionale.levels, context, 'Settings', false,
                () {}),
            getIcona(false, IconGestionale.export_icon, context, 'Logout',
                false, () {}),
            getIcona(false, IconGestionale.statistiche_cf, context,
                'Statistiche', false, () {}),
            getIcona(false, IconGestionale.shopping_bag, context, 'Shopping',
                true, () {}),
          ],
        )
      ],
    );
  }

  Widget getIcona(bool selected, IconData icona, BuildContext context,
      String text, bool ultimaIcona, Function function) {
    return InkWell(
      hoverColor: Colors.black,
      splashColor: Colors.grey,
      onTap: function,
      child: AnimatedContainer(
        color: Colors.white.withOpacity(0.95),
        duration: Duration(milliseconds: 100),
        width: MediaQuery.of(context).size.height * larghezzaColonnaicone,
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 1, color: Colors.grey),
                      bottom: BorderSide(
                          width: ultimaIcona == true ? 1 : 0,
                          color: Colors.grey))),
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.height * 0.07,
              child: Icon(
                icona,
                color: (selected == true) ? Colors.blue : Colors.grey,
              ),
            ),
            AnimatedContainer(
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1, color: Colors.grey),
                      top: BorderSide(width: 1, color: Colors.grey),
                      bottom: BorderSide(
                          width: ultimaIcona == true ? 1 : 0,
                          color: Colors.grey))),
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.height * width,
              duration: Duration(milliseconds: 100),
              child: Visibility(
                visible: testoIconaVisibile,
                child: AnimatedBuilder(
                  animation: _colorTween,
                  builder: (context, child) => Align(
                      alignment: Alignment.centerLeft,
                      child: Text(text,
                          style: TextStyle(color: _colorTween.value))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getGufo() {
    return InkWell(
      onTap: () {
        if (_animationController.status == AnimationStatus.completed) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }

        setState(() {
          if (menuAperto == false) {
            testoIconaVisibile = true;
            menuAperto = true;
            width = 0.18;
            larghezzaColonnaicone += 0.18;
            setState(() {});
          } else {
            testoIconaVisibile = false;
            menuAperto = false;
            width = 0.0;
            larghezzaColonnaicone -= 0.18;
          }
        });
      },
      child: Container(
        color: Color(0Xff285575),
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.height * 0.07,
        child: Center(
          child: Icon(
            IconGestionale.owl,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
