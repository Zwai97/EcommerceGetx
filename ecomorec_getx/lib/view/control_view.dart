import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/services/services_settings.dart';
import 'auth/login_view.dart';
import 'home_page.dart';

class ControlView extends GetView<GetCurrentUser> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.isLogin ? const HomePage() : const LoginView();
  }
}
