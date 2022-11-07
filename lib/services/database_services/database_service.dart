import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

import 'package:ivory_admin/models/product_models.dart';

class DatabaseService {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return fireStore.collection('products').snapshots().map((snapshot) {
      return (snapshot.docs.map((doc) => Product.fromsnapshot(doc)).toList());
    });
  }

  Future<void> addProduct(Product product) async {
    try {
      await fireStore.collection('products').add(product.toMap());
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
    Get.showSnackbar(GetSnackBar(
      message: 'item added successfully',
    ));
  }
}
