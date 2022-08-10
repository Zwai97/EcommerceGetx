import 'package:eco_getx_app/helper/constants.dart';
import 'package:eco_getx_app/view/widgets/custom_text.dart';
import 'package:eco_getx_app/view/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/viewmodel/cart_view_model.dart';
import '../checkout/check_out.dart';
import '../widgets/custom_button.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => controller.productCart.isEmpty
          ? const EmptyWidget()
          : Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: context.width * 0.04),
                      child: GetBuilder<CartViewModel>(
                        builder: (controller) => controller.isloading
                            ? SPIN_KIT
                            : ListView.separated(
                                itemBuilder: (context, index) => Dismissible(
                                      background: _backGroundDism(),
                                      secondaryBackground:
                                          _backSecondaryGroundDism(),
                                      onDismissed: (direction) async {
                                        if (direction ==
                                            DismissDirection.endToStart) {
                                          await controller.deleteProductCart(
                                              controller.productCart[index]);
                                        }
                                      },
                                      key: ValueKey(controller
                                          .productCart[index].productId),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: context.height * 0.15,
                                            width: context.width * 0.3,
                                            child: Image.network(
                                              '${controller.productCart[index].image}',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                    text:
                                                        '${controller.productCart[index].name}',
                                                    fsize: 24,
                                                  ),
                                                  SizedBox(
                                                      height: context.height *
                                                          0.003),
                                                  CustomText(
                                                    text:
                                                        '\$${controller.productCart[index].price}',
                                                    color: PRIMARY_COLOR,
                                                  ),
                                                  SizedBox(
                                                      height: context.height *
                                                          0.02),
                                                  Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    width: context.width * 0.3,
                                                    height:
                                                        context.height * 0.05,
                                                    decoration: BoxDecoration(
                                                        color: GREY_COLOR,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                            onTap: () => controller
                                                                .incrementQuantity(
                                                                    index),
                                                            child: const Icon(
                                                                Icons.add)),
                                                        GetBuilder<
                                                            CartViewModel>(
                                                          builder:
                                                              (controller) =>
                                                                  CustomText(
                                                            text:
                                                                '${controller.productCart[index].quantity}',
                                                            alignment: Alignment
                                                                .center,
                                                          ),
                                                        ),
                                                        InkWell(
                                                            onTap: () => controller
                                                                .decrementQuantity(
                                                                    index),
                                                            child: const Icon(
                                                                Icons.remove)),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: context.height * 0.02),
                                itemCount: controller.productCart.length),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const CustomText(
                              text: 'TOTAL  ',
                              color: TEXT_TITLE_COLOR,
                              fsize: 14,
                            ),
                            SizedBox(height: context.height * 0.003),
                            GetBuilder<CartViewModel>(
                              builder: (controller) => CustomText(
                                text: '\$ ${controller.totalPrice.toString()}',
                                fsize: 20,
                                color: PRIMARY_COLOR,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: context.width * 0.40,
                          child: CustomButton(
                              text: 'CHECKOUT',
                              onPressed: () async {
                                Get.to(() => const CheckOutView(),
                                    transition: Transition.zoom);
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Container _backSecondaryGroundDism() {
    return Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30),
        color: Colors.redAccent,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ));
  }

  Container _backGroundDism() {
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 30),
        color: Colors.amber,
        child: const Icon(
          Icons.star,
          color: Colors.white,
          size: 30,
        ));
  }
}
