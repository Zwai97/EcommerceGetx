import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/viewmodel/auth_view_model.dart';
import '../../../helper/constants.dart';
import '../../widgets/custom_text.dart';
import 'shipping_address_view.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding:
              EdgeInsets.only(top: context.height * 0.10, left: 20, right: 20),
          child: Column(
            children: [
              _profileCard(context),
              const Spacer(),
              Expanded(
                flex: 10,
                child: Column(
                  children: [
                    Expanded(
                      child: _customListTile(
                          'Edit Profile', FontAwesomeIcons.pen, () async {}),
                    ),
                    const Spacer(),
                    Expanded(
                      child: _customListTile(
                          'Shipping Address',
                          FontAwesomeIcons.locationArrow,
                          () async => Get.to(() => const ShippingAddressView(),
                              transition: Transition.zoom)),
                    ),
                    const Spacer(),
                    Expanded(
                      child: _customListTile(
                          'Order History', FontAwesomeIcons.clock, () async {}),
                    ),
                    const Spacer(),
                    Expanded(
                      child: _customListTile(
                          'Cards', FontAwesomeIcons.wallet, () async {}),
                    ),
                    const Spacer(),
                    Expanded(
                      child: _customListTile(
                          'Notifications', FontAwesomeIcons.ghost, () async {}),
                    ),
                    const Spacer(),
                    GetBuilder<AuthViewModel>(
                      builder: (controller) => Expanded(
                        child: GestureDetector(
                          onTap: () async => await controller.deleteAccount(),
                          child: const ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.dragon,
                              color: PRIMARY_COLOR,
                            ),
                            title: CustomText(
                              text: 'Delete Account',
                              fsize: 20,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GetBuilder<AuthViewModel>(
                      builder: (controller) => Expanded(
                        child: GestureDetector(
                          onTap: () async => await controller.signOut(),
                          child: const ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.doorOpen,
                              color: PRIMARY_COLOR,
                            ),
                            title: CustomText(
                              text: 'Log Out',
                              fsize: 20,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              )
            ],
          )),
    );
  }
  // 'assets/images/splash.png'
// 'assets/images/men.png'

  Row _profileCard(BuildContext context) {
    return Row(
      children: [
        GetBuilder<AuthViewModel>(
          builder: (controller) => CircleAvatar(
              backgroundImage: controller.userInfo.picture == ''
                  ? const AssetImage('assets/images/splash.png')
                  : const AssetImage('assets/images/men.png'),
              radius: 62.0
              // radius: context.width * 0.15
              ),
        ),
        // Container(
        //     height: 120,
        //     width: 120,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(60),
        //       image: const DecorationImage(
        //         image: AssetImage("assets/images/splash.png"),
        //         fit: BoxFit.fill,
        //       ),
        //     )),

        GetBuilder<AuthViewModel>(
          builder: (controller) => Expanded(
            child: Column(
              children: [
                CustomText(
                  text: '${controller.userInfo.name} ',
                  fsize: 28,
                  alignment: Alignment.center,
                ),
                SizedBox(height: context.height * 0.005),
                CustomText(
                  text: '${controller.userInfo.email}',
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

typedef OnPressed = Future<void> Function();
InkWell _customListTile(String title, IconData icon, OnPressed function) {
  return InkWell(
    overlayColor: MaterialStateProperty.all(Colors.transparent),
    onTap: function,
    child: ListTile(
        title: CustomText(
          alignment: Alignment.centerLeft,
          text: title,
          fsize: 20,
        ),
        leading: FaIcon(
          icon,
          color: PRIMARY_COLOR,
        ),
        trailing: const Icon(
          Icons.arrow_right,
          size: 30,
        )),
  );
}
