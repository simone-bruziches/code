import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:web_gestionale/api/home_dati_api.dart';
import 'package:web_gestionale/models/dati_home_model.dart';

class HomeDatiBloc {
  final api = HomeDatiApi();
  var _clientiAttivi = BehaviorSubject<Future<DatiHome>>();
  Stream<Future<DatiHome>> get clientiAttivi => _clientiAttivi.stream;
  Function(Future<DatiHome>) get changeClientiAttivi => _clientiAttivi.sink.add;

  var _numeroProve = BehaviorSubject<Future<DatiHome>>();
  Stream<Future<DatiHome>> get numeroProve => _numeroProve.stream;
  Function(Future<DatiHome>) get changeNumeroProve => _numeroProve.sink.add;

  var _abbonamentiVenduti = BehaviorSubject<Future<DatiHome>>();
  Stream<Future<DatiHome>> get abbonamentiVenduti => _abbonamentiVenduti.stream;
  Function(Future<DatiHome>) get changeAbbonamentiVenduti =>
      _abbonamentiVenduti.sink.add;

  var _ricavo = BehaviorSubject<Future<DatiHome>>();
  Stream<Future<DatiHome>> get ricavo => _ricavo.stream;
  Function(Future<DatiHome>) get changeRicavo => _ricavo.sink.add;

  getClientiAttivi() {
    changeClientiAttivi(api.getDatiClientiAttivi());
  }

  getNumeroProve() {
    changeNumeroProve(api.getDatiNumeroProve());
  }

  getAbbonamentiVenduti() {
    changeAbbonamentiVenduti(api.getDatiAbbonamentiVenduti());
  }

  getRicavo() {
    changeRicavo(api.getDatiRicavo());
  }

  dispose() {
    _clientiAttivi.close();
    _numeroProve.close();
    _abbonamentiVenduti.close();
    _ricavo.close();
  }
}

final blocHomeDati = HomeDatiBloc();
