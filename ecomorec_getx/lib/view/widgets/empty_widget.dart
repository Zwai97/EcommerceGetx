import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_text.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/empty_cart.svg',
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 30),
        const CustomText(
          text: 'No Items to Show',
          alignment: Alignment.topCenter,
        )
      ],
    );
    ;
  }
}
