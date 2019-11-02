import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_gestionale/icon_gestionale_icons.dart';
import 'package:web_gestionale/widget/home/card_list_item.dart';
import 'package:web_gestionale/widget/home/card_messaggi_item.dart';
import 'package:web_gestionale/widget/home/card_notificheNonLette_item.dart';
import 'package:web_gestionale/widget/home/card_post_item.dart';
import 'package:web_gestionale/widget/home/card_scadenze_item.dart';
import 'package:web_gestionale/widget/home/card_wod_faceList_item.dart';
import 'package:web_gestionale/widget/home/certMedici_list_item.dart';
import 'package:web_gestionale/widget/home/nextCorsi_list_item.dart';
import 'package:web_gestionale/widget/home/table_checkIn_item.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class FaceItemOriginal {
  String path;
  FaceItemOriginal({this.path});
}

class _HomeBodyState extends State<HomeBody> {
  List<CardWodFaceListItem> wodFaceList = [];
  List<FaceItemOriginal> faceListOriginal = [
    FaceItemOriginal(path: 'https://randomuser.me/api/portraits/men/61.jpg'),
    FaceItemOriginal(path: 'https://randomuser.me/api/portraits/men/32.jpg'),
    FaceItemOriginal(path: 'https://randomuser.me/api/portraits/women/57.jpg'),
    FaceItemOriginal(
        path:
            'https://images.pexels.com/photos/274595/pexels-photo-274595.jpeg?h=350&auto=compress&cs=tinysrgb'),
    FaceItemOriginal(
        path:
            'https://images-na.ssl-images-amazon.com/images/M/MV5BMTU4NTM1MTExOF5BMl5BanBnXkFtZTcwMTYwODMyMw@@._V1_UY256_CR2,0,172,256_AL_.jpg'),
    FaceItemOriginal(
        path:
            'https://pbs.twimg.com/profile_images/1031854842690641920/J1mZY1TY.jpg'),
    FaceItemOriginal(
        path:
            'https://pbs.twimg.com/profile_images/1012952090518450176/2bvuFyb8.jpg'),
    FaceItemOriginal(
        path:
            'https://images-na.ssl-images-amazon.com/images/M/MV5BN2I4Mzg3MWQtM2JlNy00ODQxLThhMGItZTFlNWFhOTIzNzY4XkEyXkFqcGdeQXVyNTEwNTA1Njg@._V1_UY256_CR103,0,172,256_AL_.jpg'),
  ];

  getWodFaceList(List<FaceItemOriginal> items) {
    for (int i = 0; i < items.length; i++) {
      double leftMargin = i * 25.0;
      wodFaceList.add(CardWodFaceListItem(
        imgPath: items[i].path,
        leftMargin: leftMargin,
      ));
    }
  }

  @override
  void initState() {
    getWodFaceList(faceListOriginal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 7,
                  child: Container(
                    child: getColonnaSinistra(),
                  ),
                ),
                SizedBox(width: 40),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: getColonnaDestra(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getColonnaSinistra() {
    return Column(children: <Widget>[
      getHorizontalListCard(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: getCardCertificatiMedici()),
          Expanded(child: getCardProssimiCorsi()),
        ],
      ),
      getCardCheckIn(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: getCardWod()),
          Expanded(child: getCardScadenze()),
        ],
      ),
    ]);
  }

  Widget getColonnaDestra() {
    return Column(
      children: <Widget>[
        getCardPost(),
        getCardMessaggi(),
        getCardNotificheNonLette()
      ],
    );
  }

  Widget getCardScadenze() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.025),
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Scadenze',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.015)),
            Expanded(
              child: ListView(
                children: <Widget>[
                  CardScadenzeItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                    data: '12/10/2020',
                  ),
                  CardScadenzeItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio:
                        'Deiocinowcnoi i if i3oi oi oiewr oinio nn hu  oi nooi ro e',
                    data: '12/10/2020',
                  ),
                  CardScadenzeItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                    data: '12/10/2020',
                  ),
                  CardScadenzeItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                    data: '12/10/2020',
                  ),
                  CardScadenzeItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                    data: '12/10/2020',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCardWod() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.025),
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('WOD',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.015)),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                    vertical: MediaQuery.of(context).size.height * 0.025),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey)),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Barbara',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.012)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5)),
                              child: Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 15,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5)),
                              child: Icon(
                                IconGestionale.pencil,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          Text('5 rounds for time',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text('20 Pull-ups',
                              style: TextStyle(color: Colors.grey)),
                          Text('20 Push-ups',
                              style: TextStyle(color: Colors.grey)),
                          Text('40 Site-ups',
                              style: TextStyle(color: Colors.grey)),
                          Text('50 Squats',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text('34 prestazioni inserite',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(height: 50, child: Stack(children: wodFaceList))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCardWod2() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.025),
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('WOD',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.015)),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                    vertical: MediaQuery.of(context).size.height * 0.025),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Barbara',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.012)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5)),
                              child: Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 15,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5)),
                              child: Icon(
                                IconGestionale.pencil,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text('5 rounds for time',
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text('20 Pull-ups', style: TextStyle(color: Colors.grey)),
                    Text('20 Push-ups', style: TextStyle(color: Colors.grey)),
                    Text('40 Site-ups', style: TextStyle(color: Colors.grey)),
                    Text('50 Squats', style: TextStyle(color: Colors.grey)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text('34 prestazioni inserite',
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Stack(children: wodFaceList),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCardPost() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.025),
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Post',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.015)),
                Container(
                  height: 25,
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      '+   Nuovo',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  CardPostItem(
                    imgPath: 'https://randomuser.me/api/portraits/men/64.jpg',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                  ),
                  CardPostItem(
                    imgPath:
                        'https://tinyfac.es/data/avatars/E0B4CAB3-F491-4322-BEF2-208B46748D4A-200w.jpeg',
                    nome: 'Marco Rossi',
                    messaggio:
                        'Deiocinowcnoi i if i3oi oi oiewr oinio nn hu  oi nooi ro e',
                  ),
                  CardPostItem(
                    imgPath:
                        'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?h=350&auto=compress&cs=tinysrgb',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                  ),
                  CardPostItem(
                    imgPath:
                        'https://images.pexels.com/photos/227294/pexels-photo-227294.jpeg?h=350&auto=compress&cs=tinysrgb',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                  ),
                  CardPostItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getHorizontalListCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: CardListItem(
            icona: Icon(
              IconGestionale.users,
              size: MediaQuery.of(context).size.height * 0.04,
              color: Colors.grey[600],
            ),
            titolo: "Clienti attivi",
            numero: "800",
            percentuale: 20,
            aumento: true,
          ),
        ),
        Expanded(
          child: CardListItem(
            icona: Icon(
              IconGestionale.open_book,
              size: MediaQuery.of(context).size.height * 0.04,
              color: Colors.grey[600],
            ),
            titolo: "Numero prove",
            numero: "250",
            percentuale: 23,
            aumento: true,
          ),
        ),
        Expanded(
          child: CardListItem(
            icona: Icon(
              IconGestionale.layout_1,
              size: MediaQuery.of(context).size.height * 0.04,
              color: Colors.grey[600],
            ),
            titolo: "Abbonamenti venduti",
            numero: "600",
            percentuale: 13,
            aumento: false,
          ),
        ),
        Expanded(
          child: CardListItem(
            icona: Text('€',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.04,
                  color: Colors.grey[600],
                )),
            titolo: "Ricavo",
            numero: "42,350",
            percentuale: 28,
            aumento: true,
          ),
        ),
      ],
    );
  }

  Widget getCardMessaggi() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.025),
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Messaggi',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.015)),
            Expanded(
              child: ListView(
                children: <Widget>[
                  CardMessaggiItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                    data: '12/10/2020',
                  ),
                  CardMessaggiItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio:
                        'Deiocinowcnoi i if i3oi oi oiewr oinio nn hu  oi nooi ro e',
                    data: '12/10/2020',
                  ),
                  CardMessaggiItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                    data: '12/10/2020',
                  ),
                  CardMessaggiItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                    data: '12/10/2020',
                  ),
                  CardMessaggiItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                    data: '12/10/2020',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCardNotificheNonLette() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.025),
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Notifiche non lette',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.015)),
            Expanded(
              child: ListView(
                children: <Widget>[
                  CardNotificheNonLetteItem(
                    messaggio: 'Hai una notifica da leggere, hbdwcvewvlwuirif ',
                  ),
                  CardNotificheNonLetteItem(
                    messaggio: 'Hai una notifica da leggere, hbdwcvewvlwuirif ',
                  ),
                  CardNotificheNonLetteItem(
                    messaggio: 'Hai una notifica da leggere, hbdwcvewvlwuirif ',
                  ),
                  CardNotificheNonLetteItem(
                    messaggio: 'Hai una notifica da leggere, hbdwcvewvlwuirif ',
                  ),
                  CardNotificheNonLetteItem(
                    messaggio: 'Hai una notifica da leggere, hbdwcvewvlwuirif ',
                  ),
                  CardNotificheNonLetteItem(
                    messaggio: 'Hai una notifica da leggere, hbdwcvewvlwuirif ',
                  ),
                  CardNotificheNonLetteItem(
                    messaggio: 'Hai una notifica da leggere, hbdwcvewvlwuirif ',
                  ),
                  CardNotificheNonLetteItem(
                    messaggio: 'Hai una notifica da leggere, hbdwcvewvlwuirif ',
                  ),
                  CardNotificheNonLetteItem(
                    messaggio: 'Hai una notifica da leggere, hbdwcvewvlwuirif ',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCardCertificatiMedici() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.025),
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Certificati Medici',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.015)),
            Expanded(
              child: ListView(
                children: <Widget>[
                  CertMediciListItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                    data: '12/10/2020',
                  ),
                  CertMediciListItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio:
                        'Deiocinowcnoi i if i3oi oi oiewr oinio nn hu  oi nooi ro e',
                    data: '12/10/2020',
                  ),
                  CertMediciListItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                    data: '12/10/2020',
                  ),
                  CertMediciListItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                    data: '12/10/2020',
                  ),
                  CertMediciListItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nome: 'Marco Rossi',
                    messaggio: 'Deiocinowcnoi i if i3oi oi oie e',
                    data: '12/10/2020',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCardProssimiCorsi() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.025),
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Prossimi Corsi',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.015)),
            Expanded(
              child: ListView(
                children: <Widget>[
                  NextCorsiListItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nomeCorso: 'Lezione di Fitness',
                    nomeCorsista: 'Marco rossi',
                    numeroSala: 1,
                    orario: '18:00 - 19:00',
                  ),
                  NextCorsiListItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nomeCorso: 'Pilates',
                    nomeCorsista: 'Marco rossi',
                    numeroSala: 1,
                    orario: '18:00 - 19:00',
                  ),
                  NextCorsiListItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nomeCorso: 'Funzionale',
                    nomeCorsista: 'Marco rossi',
                    numeroSala: 1,
                    orario: '18:00 - 19:00',
                  ),
                  NextCorsiListItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nomeCorso: 'Walking',
                    nomeCorsista: 'Marco rossi',
                    numeroSala: 1,
                    orario: '18:00 - 19:00',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getCardCheckIn() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.025),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Check In',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.015)),
                IntrinsicWidth(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: CupertinoTextField(
                      placeholderStyle: TextStyle(
                          fontFamily: 'SSC-Light', color: Colors.grey),
                      placeholder: 'N° Tessera',
                      textCapitalization: TextCapitalization.words,
                      decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(10.0)),
                          border: Border.all(color: Colors.grey)),
                    ),
                  ),
                )
              ],
            ),
            getTableCheckIn(),
          ],
        ),
      ),
    );
  }

  Widget getTableCheckIn() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01),
                    color: Colors.blue.withOpacity(0.1),
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Cliente',
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
                    child: Text('Orario',
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
                    child: Text('Abbonamento',
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
                    child: Text('Att. Medico',
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
                    child: Text('Iscrizione',
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
                    child: Text('Rate',
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
              child: ListView(
                children: <Widget>[
                  TableCheckInItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nomeCliente: 'Marco Rossi',
                    orario: "16:44:09",
                    abbonamento: true,
                  ),
                  TableCheckInItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nomeCliente: 'Marco Rossi',
                    orario: "16:44:09",
                    abbonamento: true,
                  ),
                  TableCheckInItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nomeCliente: 'Marco Rossi',
                    orario: "16:44:09",
                    abbonamento: true,
                  ),
                  TableCheckInItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nomeCliente: 'Marco Rossi',
                    orario: "16:44:09",
                    abbonamento: true,
                  ),
                  TableCheckInItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nomeCliente: 'Marco Rossi',
                    orario: "16:44:09",
                    abbonamento: true,
                  ),
                  TableCheckInItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nomeCliente: 'Marco Rossi',
                    orario: "16:44:09",
                    abbonamento: true,
                  ),
                  TableCheckInItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nomeCliente: 'Marco Rossi',
                    orario: "16:44:09",
                    abbonamento: true,
                  ),
                  TableCheckInItem(
                    imgPath:
                        'https://pbs.twimg.com/profile_images/2452384114/noplz47r59v1uxvyg8ku.png',
                    nomeCliente: 'Marco Rossi',
                    orario: "16:44:09",
                    abbonamento: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
