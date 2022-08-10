import 'package:eco_getx_app/core/viewmodel/explore_view_model.dart';
import 'package:eco_getx_app/view/bottom_nav_bar/explore/details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/constants.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/empty_widget.dart';

class CategoriesView extends GetView<ExploreViewModel> {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.filteredProducts.isEmpty
          ? _customEmptyWidget()
          : Padding(
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
                        child: CustomText(
                          text: '${Get.arguments}',
                          alignment: Alignment.center,
                          fsize: 20,
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, right: 15),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: context.width * 0.45,
                        mainAxisExtent: context.height * 0.40,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Get.to(() => DetailsView(),
                            transition: Transition.zoom,
                            arguments: controller.filteredProducts[index]),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(
                                '${controller.filteredProducts[index].image}',
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomText(
                              text:
                                  '${controller.filteredProducts[index].name}',
                            ),
                            const SizedBox(height: 6),
                            CustomText(
                              text:
                                  '${controller.filteredProducts[index].store}',
                              fsize: 12,
                              color: TEXT_TITLE_COLOR,
                            ),
                            const SizedBox(height: 10),
                            CustomText(
                              text:
                                  '\$${controller.filteredProducts[index].price}',
                              color: PRIMARY_COLOR,
                            ),
                          ],
                        ),
                      ),
                      itemCount: controller.filteredProducts.length,
                    ),
                  ),
                ],
              )),
    );
  }

  Column _customEmptyWidget() {
    return Column(
      children: [
        const Spacer(),
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
              child: CustomText(
                text: '${Get.arguments}',
                alignment: Alignment.center,
                fsize: 20,
              ),
            ),
            const Spacer()
          ],
        ),
        const Spacer(flex: 3),
        const EmptyWidget(),
        const Spacer(flex: 3),
      ],
    );
  }
}
