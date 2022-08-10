import 'package:eco_getx_app/core/viewmodel/cart_view_model.dart';
import 'package:eco_getx_app/helper/constants.dart';
import 'package:eco_getx_app/view/widgets/custom_button.dart';
import 'package:eco_getx_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';

import '../../../model/product_cart.dart';

class DetailsView extends StatelessWidget {
  DetailsView({Key? key}) : super(key: key);
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CartViewModel>(
        builder: (controller) => Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(children: [
                Image.network('${Get.arguments.image}',
                    width: double.infinity, fit: BoxFit.contain),
                Positioned(
                  top: context.height * 0.09,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                Positioned(
                  top: context.height * 0.095,
                  right: context.height * 0.02,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star_border,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(height: context.height * 0.015),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    CustomText(
                      text: '${data.name}',
                      fsize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 12.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border:
                                    Border.all(width: 2, color: GREY_COLOR)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  text: 'Size',
                                ),
                                CustomText(
                                  text: '${data.size}',
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 12.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border:
                                    Border.all(width: 2, color: GREY_COLOR)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                CustomText(
                                  text: 'Color',
                                ),
                                CustomText(text: 'Blue'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const CustomText(
                      text: 'Details',
                      fsize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 1),
                    Expanded(
                      flex: 10,
                      child: CustomScrollView(
                        physics: const BouncingScrollPhysics(),
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: CustomText(
                              text: '${data.description}',
                              height: 2.5,
                              fsize: 17,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const CustomText(
                        text: 'PRICE  ',
                        fsize: 14,
                        color: TEXT_TITLE_COLOR,
                      ),
                      SizedBox(height: context.height * 0.003),
                      CustomText(
                        text: '\$${data.price}',
                        fontWeight: FontWeight.bold,
                        fsize: 20,
                        color: PRIMARY_COLOR,
                      )
                    ],
                  ),
                  HeadShake(
                    key: controller.basicAnimation,
                    child: SizedBox(
                        width: context.width * 0.40,
                        child: CustomButton(
                            color: controller.isAdded()
                                ? TEXT_TITLE_COLOR
                                : PRIMARY_COLOR,
                            text: controller.isAdded() ? 'ADDED' : 'ADD',
                            onPressed: () async {
                              await controller.toggle(
                                  data.productId,
                                  ProductCart(
                                      name: data.name,
                                      image: data.image,
                                      price: data.price,
                                      productId: data.productId,
                                      quantity: 0));
                              controller.animate();
                            })),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
