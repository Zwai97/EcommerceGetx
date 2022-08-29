import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/viewmodel/check_out_view_model.dart';
import '../../helper/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class DeliveryTimeView extends GetView<CheckOutViewModel> {
  const DeliveryTimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _customRadioSection(
                context,
                'Standard Delivery',
                'Order will be delivered between 3 - 5 business days',
                Delivery.StandardDelivery),
          ),
          Expanded(
            child: _customRadioSection(
                context,
                'Next Day Delivery',
                'Place your order before 6pm and your items will be delivered the next day',
                Delivery.NextDayDelivery),
          ),
          Expanded(
            child: _customRadioSection(
                context,
                'Nominated Delivery',
                'Pick a particular date from the calendar and order will be delivered on selected date',
                Delivery.NominatedDelivery),
          ),
          CustomButton(
              text: 'NEXT', onPressed: () async => controller.continued()),
        ],
      ),
    );
  }

  Container _customRadioSection(
      BuildContext context, String title, String content, Delivery val) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
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
                child: CustomText(
                  text: content,
                  height: 1.5,
                ),
              ),
              Expanded(
                  child: Transform.scale(
                scale: 1.5,
                child: GetBuilder<CheckOutViewModel>(
                  builder: (controller) => Radio<Delivery>(
                      activeColor: PRIMARY_COLOR,
                      groupValue: controller.delivery,
                      value: val,
                      onChanged: (newVal) =>
                          controller.updateRadio(newVal as Delivery)),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
