import 'package:flutter/material.dart';

import '../../helper/constants.dart';
import 'custom_text.dart';

typedef OnPressed = Future<void> Function();

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final OnPressed onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(PRIMARY_COLOR),
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
