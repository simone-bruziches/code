import 'package:flutter/widgets.dart';

class AbbonamentoCliente {
  String codice;
  String nome;
  String prezzo;
  bool tipoPersonal;
  bool diProva;
  String dataInizio;
  String dataFine;
  bool bloccato;
  String alert;
  String azioni;

  AbbonamentoCliente({
    @required this.codice,
    @required this.nome,
    @required this.prezzo,
    @required this.tipoPersonal,
    @required this.diProva,
    @required this.dataInizio,
    @required this.dataFine,
    @required this.bloccato,
    @required this.alert,
    @required this.azioni,
  });
}
