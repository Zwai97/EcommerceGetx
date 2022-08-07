import 'package:flutter/material.dart';

import '../../helper/constants.dart';

typedef Validator = String? Function(String? val);
typedef OnSaved = void Function(String? val);

class CustomTextFormField extends StatelessWidget {
  final String text;
  final Validator? validator;
  final OnSaved? onsaved;
  final double? letterSpacing;
  const CustomTextFormField(
      {Key? key,
      required this.text,
      this.validator,
      this.onsaved,
      this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      validator: validator,
      decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(letterSpacing: letterSpacing),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: TEXT_TITLE_COLOR),
          ),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: PRIMARY_COLOR))),
    );
  }
}
