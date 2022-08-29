import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/viewmodel/explore_view_model.dart';
import '../../../helper/constants.dart';
import '../../widgets/custom_text.dart';
import 'categories_view.dart';
import 'details_view.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
        child: Column(
          children: [
            _searchTextField(),
            const Spacer(flex: 3),
            const CustomText(
              text: 'Categories',
              fontWeight: FontWeight.bold,
              fsize: 18,
            ),
            const Spacer(),
            Expanded(flex: 5, child: _listViewCategories(context)),
            const Spacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                  text: 'Best Selling',
                  fontWeight: FontWeight.bold,
                  fsize: 18,
                ),
                CustomText(text: 'See all'),
              ],
            ),
            const Spacer(),
            Expanded(flex: 14, child: _listViewProducts(context)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

GetBuilder<ExploreViewModel> _listViewCategories(BuildContext context) {
  return GetBuilder<ExploreViewModel>(
    builder: (controller) => controller.isloading
        ? const Center(
            child: SPIN_KIT,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...controller.categories
                  .map((e) => GestureDetector(
                      onTap: () async {
                        await controller.getFilteredProducts(e.id!);
                        Get.to(() => const CategoriesView(),
                            arguments: e.name, transition: Transition.zoom);
                      },
                      child: _categoriesItem(context, e.image, e.name)))
                  .toList(),
            ],
          ),
  );
}

Column _categoriesItem(BuildContext context, String? imageUrl, String? text) {
  return Column(
    children: [
      Expanded(
        flex: 4,
        child: CircleAvatar(
          radius: context.width * 0.08,
          backgroundColor: GREY_COLOR,
          child: Image.network(
            imageUrl!,
            width: context.width * 0.07,
          ),
        ),
      ),
      const Spacer(),
      Expanded(flex: 2, child: CustomText(text: text!)),
    ],
  );
}

GetBuilder<ExploreViewModel> _listViewProducts(BuildContext context) {
  return GetBuilder<ExploreViewModel>(
    builder: (controller) => controller.isloading
        ? const Center(
            child: SPIN_KIT,
          )
        : SizedBox(
            height: context.height * 0.45,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Get.to(() => DetailsView(),
                    arguments: controller.products[index],
                    transition: Transition.zoom),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: context.width * 0.45,
                          child: Image.network(
                            '${controller.products[index].image}',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomText(
                        text: '${controller.products[index].name}',
                      ),
                      const SizedBox(height: 6),
                      CustomText(
                        text: '${controller.products[index].store}',
                        fsize: 12,
                        color: TEXT_TITLE_COLOR,
                      ),
                      const SizedBox(height: 10),
                      CustomText(
                        text: '\$${controller.products[index].price}',
                        color: PRIMARY_COLOR,
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, _) => const SizedBox(width: 15),
              itemCount: controller.products.length,
            ),
          ),
  );
}

Container _searchTextField() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40), color: GREY_COLOR),
    child: const TextField(
      cursorColor: PRIMARY_COLOR,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    ),
  );
}
// GetBuilder<ExploreViewModel> _listViewCategories(BuildContext context) {
//   return GetBuilder<ExploreViewModel>(
//     builder: (controller) => controller.isloading
//         ? const Center(
//             child: SPIN_KIT,
//           )
//         : Container(
//             color: Colors.teal,
//             height: context.height * 0.15,
//             child: ListView.separated(
//                 physics: const BouncingScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) => Container(
//                       color: Colors.amber,
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(10.0),
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(50)),
//                             height: 70,
//                             width: 70,
//                             child: Image.network(
//                               '${controller.categories[index].image}',
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           CustomText(
//                             text: '${controller.categories[index].name}',
//                             color: TEXT_TITLE_COLOR,
//                           )
//                         ],
//                       ),
//                     ),
//                 separatorBuilder: (context, index) => const SizedBox(width: 10),
//                 itemCount: controller.categories.length),
//           ),
//   );
// }
