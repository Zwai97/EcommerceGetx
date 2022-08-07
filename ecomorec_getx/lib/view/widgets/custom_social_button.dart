import 'package:flutter/material.dart';

import '../../helper/constants.dart';
import 'custom_text.dart';

typedef OnTap = Future<void> Function();

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton(
      {Key? key,
      required this.icon,
      required this.text,
      required this.color,
      required this.onTap})
      : super(key: key);
  final IconData icon;
  final Color color;
  final OnTap onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        decoration: BoxDecoration(
          border: Border.all(color: TEXT_TITLE_COLOR, width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 30,
              color: color,
            ),
            const SizedBox(
              width: 50,
            ),
            CustomText(
              text: text,
              fsize: 14,
            )
          ],
        ),
      ),
    );
  }
}
