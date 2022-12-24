import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  final color, text, fontweight, size;
  Customtext(
      {this.color = Colors.white,
      @required this.text,
      this.size,
      this.fontweight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontweight,
        color: color,
      ),
    );
  }
}
