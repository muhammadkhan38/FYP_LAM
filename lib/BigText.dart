import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  // TextOverflow overflow;
  const BigText(
      {super.key,
      this.color,
      required this.text,
      // this.overflow=TextOverflow.ellipsis,
      this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      // overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
