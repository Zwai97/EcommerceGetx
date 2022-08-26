import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/viewmodel/bottom_nav_bar_view_mode.dart';
import '../helper/constants.dart';

class HomePage extends GetView<BottomNavBarViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GetX<BottomNavBarViewModel>(
            builder: (controller) => BottomNavyBar(
                selectedIndex: controller.currentIndex.value,
                showElevation: true,
                items: _listNavyBar,
                onItemSelected: (index) =>
                    controller.currentIndex.value = index)),
        body: GetX<BottomNavBarViewModel>(
            builder: (controller) =>
                controller.screens[controller.currentIndex.value]));
  }

  List<BottomNavyBarItem> get _listNavyBar {
    return [
      BottomNavyBarItem(
          icon: const Icon(Icons.ads_click_sharp),
          title: const Text('Explore'),
          inactiveColor: TEXT_TITLE_COLOR,
          activeColor: PRIMARY_COLOR),
      BottomNavyBarItem(
          icon: const Icon(Icons.add_shopping_cart),
          title: const Text('Cart'),
          inactiveColor: TEXT_TITLE_COLOR,
          activeColor: PRIMARY_COLOR),
      BottomNavyBarItem(
          icon: const Icon(Icons.person),
          title: const Text('Account'),
          inactiveColor: TEXT_TITLE_COLOR,
          activeColor: PRIMARY_COLOR),
    ];
  }
}
