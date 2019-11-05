import 'package:rxdart/rxdart.dart';
import 'package:web_gestionale/models/abbonamento_cliente_model.dart';
import 'package:web_gestionale/models/cliente_model.dart';


class ClientiScreenBloc {
  List<Cliente> _listaClientiProva = [
    Cliente(
        imgPath:
            'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
        nome: 'Simone Bruziches',
        email: 'simi@gmail.com',
        stato: true,
        messaggiDaLeggere: 'nessuno',
        abbonamentiAttivi: 'Abbonamento - scade il 13/11/2019',
        alert: false,
        azioni: 'Scegli azione'),
    Cliente(
        imgPath:
            'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
        nome: 'Marco Rossi',
        email: 'simi@gmail.com',
        stato: false,
        messaggiDaLeggere: 'nessuno',
        abbonamentiAttivi: 'Abbonamento - scade il 13/11/2019',
        alert: false,
        azioni: 'Scegli azione'),
    Cliente(
        imgPath:
            'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
        nome: 'Silvano Lippi',
        email: 'simi@gmail.com',
        stato: true,
        messaggiDaLeggere: 'nessuno',
        abbonamentiAttivi: 'Abbonamento - scade il 13/11/2019',
        alert: false,
        azioni: 'Scegli azione'),
  ];

  List<AbbonamentoCliente> _listaAbbonamentiClienti = [
    AbbonamentoCliente(
        codice: '001',
        nome: 'Abb. 3 ingressi',
        prezzo: '€ 15.00',
        tipoPersonal: true,
        diProva: false,
        dataInizio: '29/10/2019',
        dataFine: '29/10/2019',
        bloccato: false,
        alert: '',
        azioni: ''),
    AbbonamentoCliente(
        codice: '002',
        nome: 'Abb. 2 ingressi',
        prezzo: '€ 15.00',
        tipoPersonal: true,
        diProva: false,
        dataInizio: '29/10/2019',
        dataFine: '29/10/2019',
        bloccato: false,
        alert: '',
        azioni: ''),
    AbbonamentoCliente(
        codice: '003',
        nome: 'Abb. 3 ingressi',
        prezzo: '€ 15.00',
        tipoPersonal: true,
        diProva: false,
        dataInizio: '29/10/2019',
        dataFine: '29/10/2019',
        bloccato: false,
        alert: '',
        azioni: ''),
    AbbonamentoCliente(
        codice: '004',
        nome: 'Abb. 3 ingressi',
        prezzo: '€ 15.00',
        tipoPersonal: true,
        diProva: false,
        dataInizio: '29/10/2019',
        dataFine: '29/10/2019',
        bloccato: false,
        alert: '',
        azioni: ''),
    AbbonamentoCliente(
        codice: '005',
        nome: 'Abb. 3 ingressi',
        prezzo: '€ 15.00',
        tipoPersonal: true,
        diProva: false,
        dataInizio: '29/10/2019',
        dataFine: '29/10/2019',
        bloccato: false,
        alert: '',
        azioni: ''),
  ];

  var _listaLenght = BehaviorSubject<bool>();
  Stream<bool> get listaLenght => _listaLenght.stream;
  Function(bool) get changeListaLenght => _listaLenght.sink.add;

  var _listaClienti = BehaviorSubject<List<Cliente>>();
  Stream<List<Cliente>> get listaClienti => _listaClienti.stream;
  Function(List<Cliente>) get changelistaClienti => _listaClienti.sink.add;

  var _infoCliente = BehaviorSubject<Cliente>();
  Stream<Cliente> get infoCliente => _infoCliente.stream;
  Function(Cliente) get changeInfoCliente => _infoCliente.sink.add;

  var _listaAbbonamentiCliente = BehaviorSubject<List<AbbonamentoCliente>>();
  Stream<List<AbbonamentoCliente>> get listaAbbonamentiCliente =>
      _listaAbbonamentiCliente.stream;
  Function(List<AbbonamentoCliente>) get changeListaAbbonamentiCliente =>
      _listaAbbonamentiCliente.sink.add;

  void getListaClienti() {
    print(1);
    changelistaClienti(_listaClientiProva);
  }

  void getListaAbbonamentiCliente() {
    changeListaAbbonamentiCliente(_listaAbbonamentiClienti);
  }

  dispose() {
    _listaLenght.close();
    _listaClienti.close();
    _infoCliente.close();
    _listaAbbonamentiCliente.close();
  }
}

final blocClientiScreen = ClientiScreenBloc();
