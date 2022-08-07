import 'package:eco_getx_app/core/viewmodel/check_out_view_model.dart';
import 'package:eco_getx_app/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_divider.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/custom_text.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({Key? key}) : super(key: key);

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
                Expanded(
                  flex: 6,
                  child: GetBuilder<CheckOutViewModel>(
                    init: CheckOutViewModel(),
                    builder: (controller) => CustomText(
                      text: controller.screens[controller.currentStep] ==
                              controller.screens[2]
                          ? 'Summary'
                          : 'CheckOut',
                      alignment: Alignment.center,
                      fsize: 20,
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
            SizedBox(height: context.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GetBuilder<CheckOutViewModel>(
                init: CheckOutViewModel(),
                builder: (controller) => Row(
                  children: [
                    const CustomStepper(color: PRIMARY_COLOR),
                    CustomDivider(color: controller.stepOne),
                    CustomStepper(color: controller.stepOne),
                    CustomDivider(color: controller.stepTwo),
                    CustomStepper(color: controller.stepTwo),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText(text: 'Delivery'),
                  CustomText(text: 'Address'),
                  CustomText(text: 'Summary'),
                ],
              ),
            ),
            const SizedBox(height: 25),
            GetBuilder<CheckOutViewModel>(
              builder: (controller) =>
                  Expanded(child: controller.screens[controller.currentStep]),
            ),
          ],
        ),
      ),
    );
  }
}



//////////////////////////Stepper Widget/////////////////////////////

// IconButton(
//                   onPressed: () => Get.back(),
//                   icon: const Icon(Icons.arrow_back_ios),
//                 ),

// Stepper(
//                 currentStep: controller.currentStep,
//                 steps: [
//                   Step(
//                     title: const CustomText(text: 'Delivery'),
//                     content: Text('dsadsa'),
//                     isActive: controller.currentStep >= 0,
//                     state: controller.currentStep == 0
//                         ? StepState.editing
//                         : StepState.complete,
//                   ),
//                   Step(
//                     title: const CustomText(text: 'Address'),
//                     content: Text('dsadsa'),
//                     isActive: controller.currentStep >= 1,
//                     state: controller.currentStep == 1
//                         ? StepState.editing
//                         : StepState.complete,
//                   ),
//                   Step(
//                     title: const CustomText(text: 'Summary'),
//                     content: Text('dsadsa'),
//                     isActive: controller.currentStep >= 2,
//                     state: controller.currentStep == 2
//                         ? StepState.editing
//                         : StepState.complete,
//                   ),
//                 ],
//                 onStepCancel: controller.cancel,
//                 onStepContinue: controller.continued,
//                 // onStepTapped: (step) => controller.tapped(step),
//                 type: StepperType.horizontal,
//               ),