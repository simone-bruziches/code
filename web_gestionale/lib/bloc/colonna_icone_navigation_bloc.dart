import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_gestionale/screens/clienti_screen.dart';
import 'package:web_gestionale/widget/home/home_body.dart';

class ColonnaIconeNavigationBloc {
  var _screenBody = BehaviorSubject<int>();
  Stream<int> get screenBody => _screenBody.stream;
  Function(int) get changeScreenBody => _screenBody.sink.add;

  getHomeScreen() {
    changeScreenBody(0);
  }

  void getClientiScreen() {
    changeScreenBody(2);
  }

  dispose() {
    _screenBody.close();
  }
}

final blocScreenBody = ColonnaIconeNavigationBloc();
