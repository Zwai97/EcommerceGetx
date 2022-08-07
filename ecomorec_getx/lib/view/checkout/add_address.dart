import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/viewmodel/check_out_view_model.dart';
import '../../helper/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class AddAddressView extends GetView<CheckOutViewModel> {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // color: Colors.green,
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: const [
                      Icon(
                        Icons.check_circle,
                        size: 30,
                        color: PRIMARY_COLOR,
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: CustomText(
                          text:
                              'Billing address is the same as delivery address',
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.height * 0.02),
                Expanded(
                  flex: 7,
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Form(
                          key: controller.formState,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    const CustomText(
                                        text: 'Street 1', color: BLACK_COLOR),
                                    CustomTextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You Must Type Your Street';
                                          }
                                          return null;
                                        },
                                        onsaved: (value) =>
                                            controller.street1 = value,
                                        text: '21, Alex Davidson Avenue'),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    const CustomText(
                                        text: 'Street 2', color: BLACK_COLOR),
                                    CustomTextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You Must Type Your Street';
                                          }
                                          return null;
                                        },
                                        onsaved: (value) =>
                                            controller.street2 = value,
                                        text:
                                            'Opposite Omegatron, Vicent Quarters'),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    const CustomText(
                                        text: 'City', color: BLACK_COLOR),
                                    CustomTextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'You Must Type Your City';
                                          }
                                          return null;
                                        },
                                        onsaved: (value) =>
                                            controller.city = value,
                                        text: 'Victoria Island'),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          const CustomText(
                                              text: 'State',
                                              color: BLACK_COLOR),
                                          CustomTextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'You Must Type Your State';
                                                }
                                                return null;
                                              },
                                              onsaved: (value) =>
                                                  controller.state = value,
                                              text: 'Lagos State'),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          const CustomText(
                                              text: 'Country',
                                              color: BLACK_COLOR),
                                          CustomTextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'You Must Type Your Country';
                                                }
                                                return null;
                                              },
                                              onsaved: (value) =>
                                                  controller.country = value,
                                              text: 'Nigeria'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: context.width * 0.40,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(20)),
                          side: MaterialStateProperty.all(
                            const BorderSide(color: PRIMARY_COLOR, width: 2),
                          ),
                        ),
                        onPressed: () => controller.cancel(),
                        child: const CustomText(
                          text: 'BACK',
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: context.width * 0.40,
                        child: CustomButton(
                            text: 'NEXT',
                            onPressed: () async {
                              await controller.saveUserAddress();
                            })),
                  ],
                ),
              ],
            )));
  }
}
