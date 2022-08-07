import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  const CustomDivider({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        thickness: 1.8,
        color: color,
      ),
    );
  }
}
