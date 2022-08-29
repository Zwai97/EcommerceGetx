import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:get/get.dart';

import '../../model/product_cart.dart';
import '../services/database.dart';

class CartViewModel extends GetxController {
  final GlobalKey<AnimatorWidgetState> basicAnimation =
      GlobalKey<AnimatorWidgetState>();
  animate() {
    basicAnimation.currentState!.forward();
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  List<ProductCart> _productCart = [];
  List<ProductCart> get productCart => _productCart;
  DatabaseHelper instance = DatabaseHelper.instance;
  late bool _isloading;
  bool get isloading => _isloading;

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////

  int counter = 0;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  void getTotalPrice() {
    for (var element in _productCart) {
      _totalPrice += (double.parse(element.price!) * element.quantity!);
    }
    update();
  }

  void incrementQuantity(int index) async {
    _productCart[index].quantity = _productCart[index].quantity! + 1;
    _totalPrice += (double.parse(_productCart[index].price!));
    await updateProductCart(_productCart[index]);
    update();
  }

  void decrementQuantity(int index) async {
    if (_productCart[index].quantity! > 0) {
      _productCart[index].quantity = _productCart[index].quantity! - 1;
      _totalPrice -= (double.parse(_productCart[index].price!));
      await updateProductCart(_productCart[index]);
    }
    update();
  }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<void> getProductCart() async {
    _isloading = true;
    _productCart = await instance.getData();
    _isloading = false;
    getTotalPrice();
    update();
  }

  Future<void> addProductCart(ProductCart productCart) async {
    final List<ProductCart> itemIsExist = _productCart
        .where((e) => e.productId == productCart.productId)
        .toList();
    if (itemIsExist.isEmpty) {
      await instance.insertData(productCart);
      _productCart.add(productCart);
      _totalPrice += (double.parse(productCart.price!) * productCart.quantity!);
      update();
    }
  }

  bool isAdded() => _productCart
      .any((element) => element.productId == Get.arguments.productId);

  Future<void> updateProductCart(ProductCart productCart) async =>
      await instance.updateData(productCart);

  Future<void> deleteProductCart(ProductCart productCart) async {
    await instance.deleteData(productCart);
    _productCart.remove(productCart);
    _totalPrice -= (double.parse(productCart.price!) * productCart.quantity!);
    update();
  }

  Future<void> toggleProductCart(var data) async {
    final int currentIndex = _productCart
        .indexWhere((element) => element.productId == data.productId);
    if (currentIndex >= 0) {
      await deleteProductCart(_productCart[currentIndex]);
    } else {
      await addProductCart(ProductCart(
          name: data.name,
          image: data.image,
          price: data.price,
          productId: data.productId,
          quantity: 1));
    }
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  void onInit() async {
    await getProductCart();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    basicAnimation.currentState!.dispose();
  }
}


// double total = _cart.map<double>((item) => item.count*item.price).reduce((value1, value2) => value1+value2);

// class Dish{
//   int count;
//   double price;

//   double totalPrice(){
//     // add your price calculation logic
//     return price * count;
//   }
// }
// add the below method in your Cart widget

// double cartTotalPrice(){
//   double total=0;
//   _cart.forEach((item) { total += item.totalPrice(); });
//   return total;
// }