import 'package:eco_getx_app/view/bottom_nav_bar/explore/explore_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_animator/widgets/animator_widget.dart';
import 'package:get/get.dart';

import '../../view/bottom_nav_bar/account/account_view.dart';
import '../../view/bottom_nav_bar/cart_view.dart';

class BottomNavBarViewModel extends GetxController {
  final GlobalKey<AnimatorWidgetState> basicAnimation =
      GlobalKey<AnimatorWidgetState>();
  animate() {
    basicAnimation.currentState!.forward();
  }

  RxInt currentIndex = 0.obs;
  List<Widget> screens = [
    const ExploreView(),
    HeadShake(child: const CartView()),
    BounceInDown(child: const AccountView()),
  ];

  @override
  void onClose() {
    basicAnimation.currentState!.dispose();
    super.onClose();
  }
}
