import 'package:flutter/material.dart';

class ReusableListTileWithInput extends StatelessWidget {
  final  richTextTitle;
  final  richTextSubtitle;
  final String hintText;
  final TextEditingController controller;
  final int maxLengthPerLine;

  const ReusableListTileWithInput({
    Key? key,
     this.richTextTitle,
     this.richTextSubtitle,
    required this.hintText,
    required this.controller,
    this.maxLengthPerLine = 35,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: " \t\t\t\t  $richTextTitle ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            TextSpan(
              text: richTextSubtitle,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      subtitle: Container(
        margin: const EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: null, // Allows unlimited lines
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.grey,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
          ),
          onChanged: (value) {
            if (value.isNotEmpty && value.length % maxLengthPerLine == 10) {
              controller.text = '$value';
              controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length),
              );
            }
          },
        ),
      ),
    );
  }
}



























//import 'package:flutter/material.dart';

class ReusableTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final double width;
  final int maxLengthPerLine;

  const ReusableTextInput({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.width,
    this.maxLengthPerLine = 25, required int maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: null, // Allows for unlimited lines
        decoration: InputDecoration(
          filled: false,
          fillColor: const Color(0xffFFFFFF),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 12.0,
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && value.length % maxLengthPerLine == 0) {
            // Automatically adds a new line when max length per line is reached
            controller.text = '$value\n';
            controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length),
            );
          }
        },
      ),
    );
  }
}
