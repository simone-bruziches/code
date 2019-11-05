import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:web_gestionale/bloc/clienti_screen_bloc.dart';
import 'package:web_gestionale/models/cliente_model.dart';
import 'package:web_gestionale/widget/clienti/lista_corta_clienti_item.dart';
import 'package:web_gestionale/models/cliente_model.dart';



class ListaCortaClienti extends StatefulWidget {
  double sizeTextTableItem;
  ListaCortaClienti({@required this.sizeTextTableItem});
  @override
  _ListaCortaClientiState createState() => _ListaCortaClientiState();
}

class _ListaCortaClientiState extends State<ListaCortaClienti> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: blocClientiScreen.listaClienti,
        builder: (context, AsyncSnapshot<List<Cliente>> snapshot) {
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
                        itemCount: snapshot.hasData ? snapshot.data.length : 0,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                  child: InkWell(
                                onTap: () {},
                                child: ListaCortaClientiItem(
                                    cliente: snapshot.data[index],
                                    sizeText: widget.sizeTextTableItem),
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
        });
  }
}
