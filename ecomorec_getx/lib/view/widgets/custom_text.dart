import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final Alignment? alignment;
  final double? fsize;
  final FontWeight? fontWeight;
  final double? height;

  const CustomText(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.alignment = Alignment.topLeft,
      this.fsize = 16.0,
      this.fontWeight,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontSize: fsize,
            fontWeight: fontWeight,
            height: height),
      ),
    );
  }
}
