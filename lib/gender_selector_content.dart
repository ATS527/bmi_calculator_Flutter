import 'package:flutter/material.dart';
import 'constants.dart';

class GenderSelectorContent extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final double fontSize;
  final String text;
  GenderSelectorContent({this.icon, this.iconSize, this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: kinactiveContentColor,
          size: iconSize,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: klabelText,
        ),
      ],
    );
  }
}
