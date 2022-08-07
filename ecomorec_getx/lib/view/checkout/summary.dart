import 'package:eco_getx_app/core/viewmodel/cart_view_model.dart';
import 'package:eco_getx_app/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/viewmodel/check_out_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetBuilder<CartViewModel>(
            builder: (controller) => (Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.only(left: 20),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            '${controller.productCart[index].image}',
                            width: context.width * 0.45,
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomText(
                            text: '${controller.productCart[index].name}'),
                        const SizedBox(height: 5),
                        CustomText(
                            text: '\$${controller.productCart[index].price}',
                            color: PRIMARY_COLOR),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: controller.productCart.length),
            )),
          ),
          const Divider(thickness: 2, color: SECOND_GREY_COLOR),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const Expanded(
                    child: CustomText(
                      text: 'Shipping Address',
                      fsize: 22,
                      alignment: Alignment.centerLeft,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GetBuilder<CheckOutViewModel>(
                                builder: (controller) => CustomText(
                                    height: 1.6,
                                    text:
                                        '${controller.street1} ${controller.street2}\n ${controller.city} ${controller.state}\n ${controller.country}'),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.topCenter,
                              child: Icon(
                                Icons.check_circle,
                                size: 30,
                                color: PRIMARY_COLOR,
                              ),
                            )
                          ],
                        ),
                        GetBuilder<CheckOutViewModel>(
                          builder: (controller) => TextButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero)),
                              onPressed: () => controller.cancel(),
                              child: const CustomText(
                                alignment: Alignment.centerLeft,
                                color: PRIMARY_COLOR,
                                text: 'Change',
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(thickness: 2, color: SECOND_GREY_COLOR),
          GetBuilder<CheckOutViewModel>(
            builder: (controller) => Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.width * 0.40,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(20)),
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
                          text: 'Deliver',
                          onPressed: () async => controller.continued())),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
