import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final  color;
  final txtsize;
  final int maxLines;
  final TextStyle? textStyle;
  final InputBorder? border;
  final TextStyle? hintStyle;

  final VoidCallback? onTap;

  final dynamic readOnly;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.color,
    this.hintText = "",
    this.maxLines = 1,
    this.textStyle,
    this.border,
    this.hintStyle,
    this.txtsize,
    this.onTap,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      keyboardType: TextInputType.multiline,
      maxLines: null,
    //  maxLines: maxLines,
      style: textStyle ??
          TextStyle(
            color: color,
            fontSize: txtsize,
            fontWeight: FontWeight.bold,
          ),
      decoration: InputDecoration(
        border: border ?? InputBorder.none,
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyle(color: Colors.blue),
      ),
      onChanged: (value) {
        if (value.isNotEmpty && value.length % maxLines == 10) {
          controller.text = '$value';
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        }
      },
    );
  }
}
