import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  final Color color;
  final Widget childCard;
  ReusableWidget({@required this.color, this.childCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
