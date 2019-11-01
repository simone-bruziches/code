import 'package:flutter/material.dart';

class CardWodFaceListItem extends StatefulWidget {
  String imgPath;
  double leftMargin;
  CardWodFaceListItem({@required this.imgPath, @required this.leftMargin});
  @override
  _CardWodFaceListItemState createState() => _CardWodFaceListItemState();
}

class _CardWodFaceListItemState extends State<CardWodFaceListItem> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.leftMargin,
          child: CircleAvatar(
        radius: MediaQuery.of(context).size.height * 0.025,
        backgroundImage: NetworkImage(widget.imgPath),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
