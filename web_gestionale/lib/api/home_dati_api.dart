import 'dart:async';
import 'dart:convert';
import 'package:web_gestionale/models/dati_home_model.dart';

class HomeDatiApi {
  var datiClientiAttivi =
      '{"numero":"194", "percentuale": 13, "aumento": true}';
  var datiNumeroProve = '{"numero":"250", "percentuale": 25, "aumento": true}';
  var datiAbbonamentiVenduti =
      '{"numero":"112", "percentuale": 2, "aumento": false}';
  var datiRicavo = '{"numero":"11,920", "percentuale": 8, "aumento": true}';
  Future<DatiHome> getDatiClientiAttivi() {
    var parsedJson = json.decode(datiClientiAttivi);
    return new Future.delayed(
        Duration(seconds: 3), () => DatiHome.fromJson(parsedJson));
  }

  Future<DatiHome> getDatiNumeroProve() {
    var parsedJson = json.decode(datiNumeroProve);
    return new Future.delayed(
        Duration(seconds: 3), () => DatiHome.fromJson(parsedJson));
  }

  Future<DatiHome> getDatiAbbonamentiVenduti() {
    var parsedJson = json.decode(datiAbbonamentiVenduti);
    return new Future.delayed(
        Duration(seconds: 3), () => DatiHome.fromJson(parsedJson));
  }

  Future<DatiHome> getDatiRicavo() {
    var parsedJson = json.decode(datiRicavo);
    return new Future.delayed(
        Duration(seconds: 3), () => DatiHome.fromJson(parsedJson));
  }
}
