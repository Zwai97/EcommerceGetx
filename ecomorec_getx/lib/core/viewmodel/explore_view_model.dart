import 'package:get/get.dart';

import '../../model/category.dart';
import '../../model/product.dart';
import '../services/firestore_service.dart';

class ExploreViewModel extends GetxController {
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  final List<Product> _products = [];
  List<Product> get products => _products;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  final List<Category> _categories = [];
  List<Category> get categories => _categories;

  List<Product> filteredProducts = [];
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  late bool _isloading;
  bool get isloading => _isloading;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<void> getCategories() async {
    _isloading = true;
    await FireStoreService.instance.getCategories().then((value) => value
        .map((e) => _categories.add(Category.fromJson(e.data())))
        .toList());
    _isloading = false;
    update();
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<void> getProducts() async {
    _isloading = true;
    await FireStoreService.instance.getProducts().then((value) =>
        value.map((e) => _products.add(Product.fromJson(e.data()))).toList());
    _isloading = false;
    update();
  }

  Future<void> getFilteredProducts(String id) async {
    _isloading = true;
    filteredProducts =
        _products.where((element) => element.category!.contains(id)).toList();
    _isloading = false;
    update();
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  void onInit() async {
    await getCategories();
    await getProducts();

    super.onInit();
  }
}
