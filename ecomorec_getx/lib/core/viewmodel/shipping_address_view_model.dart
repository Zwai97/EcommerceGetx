import 'package:get/get.dart';

import '../../helper/constants.dart';

class ShippingAddressViewModel extends GetxController {
  Address address = Address.HomeAddress;
  void updateRadio(Address newVal) {
    address = newVal;
    update();
  }
}
