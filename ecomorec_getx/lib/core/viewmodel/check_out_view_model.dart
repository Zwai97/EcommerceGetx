import 'package:eco_getx_app/helper/constants.dart';
import 'package:eco_getx_app/view/checkout/add_address.dart';
import 'package:eco_getx_app/view/checkout/delivery_time.dart';
import 'package:eco_getx_app/view/checkout/summary.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/animator_widget.dart';
import 'package:get/get.dart';

import '../services/firestore_service.dart';

class CheckOutViewModel extends GetxController {
  final GlobalKey<AnimatorWidgetState> basicAnimation =
      GlobalKey<AnimatorWidgetState>();
  animate() {
    basicAnimation.currentState!.forward();
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  int _currentStep = 0;
  int get currentStep => _currentStep;
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  Color _stepOne = SECOND_GREY_COLOR;
  Color _stepTwo = SECOND_GREY_COLOR;
  Color get stepOne => _stepOne;
  Color get stepTwo => _stepTwo;
  ///////////////////////////////////////////////////////////////////////////////////////////////////////
  String? street1, street2, city, state, country;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final User? _user = FirebaseAuth.instance.currentUser;
  //////////////////////////////////////////////////////////////////////////////////////////////////////////
  Delivery delivery = Delivery.StandardDelivery;
  void updateRadio(Delivery newVal) {
    delivery = newVal;
    update();
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////
  List<Widget> screens = const [
    DeliveryTimeView(),
    AddAddressView(),
    SummaryView()
  ];

  // Widget getScreen() {
  //   int index = 0;
  //   late Widget screen;
  //   for (var element in screens) {
  //     if (_currentStep == index) {
  //       screen = element;
  //     }
  //     index++;
  //   }
  //   return screen;
  // }

///////////////////////////////////////////////////////////////////////////////////////////////////////
  void tapped(int step) {
    _currentStep = step;
    update();
  }

  void continued() {
    _currentStep < 2 ? _currentStep += 1 : null;
    _currentStep == 1 ? _stepOne = PRIMARY_COLOR : SECOND_GREY_COLOR;
    _currentStep == 2 ? _stepTwo = PRIMARY_COLOR : SECOND_GREY_COLOR;
    animate();
    update();
  }

  void cancel() {
    _currentStep > 0 ? _currentStep -= 1 : null;
    _currentStep == 1 ? _stepTwo = SECOND_GREY_COLOR : PRIMARY_COLOR;
    _currentStep == 0 ? _stepOne = SECOND_GREY_COLOR : PRIMARY_COLOR;
    animate();
    update();
  }

  Future<void> saveUserAddress() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        await FireStoreService.instance.updateUser(_user!.uid, {
          'address': {
            'street1': street1!,
            'street2': street2!,
            'city': city!,
            'state': state!,
            'country': country!,
          }
        });
        continued();
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    basicAnimation.currentState!.dispose();
  }
}
