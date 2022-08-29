import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/viewmodel/check_out_view_model.dart';
import '../../../core/viewmodel/shipping_address_view_model.dart';
import '../../../helper/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                const Expanded(
                  flex: 6,
                  child: CustomText(
                    text: 'Shipping Address',
                    alignment: Alignment.center,
                    fsize: 20,
                  ),
                ),
                const Spacer()
              ],
            ),
            const Spacer(),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: _customRadioSection(
                          context,
                          'Home Address',
                          '21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria',
                          Address.HomeAddress),
                    ),
                    Expanded(
                      child: _customRadioSection(
                          context,
                          'Work Address',
                          '19, Martins Crescent, Bank of Nigeria, Abuja, Nigeria',
                          Address.WorkAddress),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            CustomButton(text: 'New', onPressed: () async {})
          ],
        ),
      ),
    );
  }

  Column _customRadioSection(
      BuildContext context, String title, String content, Address val) {
    return Column(
      children: [
        CustomText(
          text: title,
          fsize: 24,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: context.height * 0.02),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: GetBuilder<CheckOutViewModel>(
                init: CheckOutViewModel(),
                builder: (controller) => CustomText(
                  text: content,
                  height: 1.5,
                ),
              ),
            ),
            Expanded(
                child: Transform.scale(
              scale: 1.5,
              child: GetBuilder<ShippingAddressViewModel>(
                init: ShippingAddressViewModel(),
                builder: (controller) => Radio<Address>(
                    activeColor: PRIMARY_COLOR,
                    groupValue: controller.address,
                    value: val,
                    onChanged: (newVal) =>
                        controller.updateRadio(newVal as Address)),
              ),
            ))
          ],
        )
      ],
    );
  }
}
