import 'dart:developer';

import 'package:get/get.dart';
import 'package:ivory_admin/models/product_models.dart';
import 'package:ivory_admin/services/database_services/database_service.dart';

class ProductController extends GetxController {
  DatabaseService databaseService = DatabaseService();
  var products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(databaseService.getProducts());

    log(products.length.toString());

    super.onInit();
  }

  Future<void> updateProduct(
    Product product,
    String field,
    double value,
  ) async {
    await databaseService.updateProduct(product, field, value);
  }

  var isImageLoading = false;
  var newProduct = {}.obs;

  get price => newProduct['price'];
  get quantity => newProduct['quantity'];
  get name => newProduct['name'];
  List<String> get images => newProduct['images'];
  get description => newProduct['description'];
  get maincategory => newProduct['mainCategory'];
  get subcategory => newProduct['subcategory'];
  get colors => newProduct['colors'];
  // List<String> get sizes => newProduct['sizes'];

  String mainCategory = 'Men';
  String subCategory = 'Fasion';
  List<String> size = [];
  String shoeSize = '8';
}
