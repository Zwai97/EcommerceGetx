import 'package:flutter/material.dart';

import '../../helper/constants.dart';
import 'custom_text.dart';

typedef OnPressed = Future<void> Function();

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color = PRIMARY_COLOR})
      : super(key: key);
  final String text;
  final OnPressed onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        ),
        onPressed: onPressed,
        child: CustomText(
          color: Colors.white,
          text: text,
          alignment: Alignment.center,
        ));
  }
}
