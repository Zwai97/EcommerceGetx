import 'package:get/get.dart';

import '../core/viewmodel/auth_view_model.dart';
import '../core/viewmodel/bottom_nav_bar_view_mode.dart';
import '../core/viewmodel/cart_view_model.dart';
import '../core/viewmodel/explore_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthViewModel>(AuthViewModel());
    Get.put<BottomNavBarViewModel>(BottomNavBarViewModel());
    Get.put<ExploreViewModel>(ExploreViewModel());
    Get.put<CartViewModel>(CartViewModel());
    // Get.put<CheckOutViewModel>(CheckOutViewModel());
  }
}

// class CartBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put<CartViewModel>(CartViewModel());
//   }
// }

// class ExploreBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put<ExploreViewModel>(ExploreViewModel());
//   }
// }

// class BottomNavBarBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put<BottomNavBarViewModel>(BottomNavBarViewModel());
//   }
// }

// class AuthBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put<AuthViewModel>(AuthViewModel());
//   }
// }
