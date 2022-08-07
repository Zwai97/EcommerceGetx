import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../view/bottom_nav_bar/account/account_view.dart';
import '../../view/bottom_nav_bar/cart_view.dart';
import '../../view/bottom_nav_bar/explore/explore_view.dart';

class BottomNavBarViewModel extends GetxController {
  RxInt currentIndex = 0.obs;
  List<Widget> screens = const [ExploreView(), CartView(), AccountView()];
}
