import 'package:get/get.dart';
import 'package:ivory_admin/models/product_models.dart';

class ProductController extends GetxController {
  List<Product> products = Product.products.obs;
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

  String mainCategory = 'Men';
  String subCategory = 'Fasion';
  String size = 'S';
  String shoeSize = '8';
}
