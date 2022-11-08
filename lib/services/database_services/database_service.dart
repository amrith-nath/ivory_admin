import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:ivory_admin/models/order_model.dart';

import 'package:ivory_admin/models/product_models.dart';
import 'package:ivory_admin/models/user_model.dart';

class DatabaseService {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Stream<List<Product>> getProducts() {
    return fireStore.collection('products').snapshots().map((snapshot) {
      return (snapshot.docs.map((doc) => Product.fromsnapshot(doc)).toList());
    });
  }

  Stream<List<Order>> getOrders() {
    return fireStore.collection('orders').snapshots().map((snapshot) {
      return (snapshot.docs.map((doc) => Order.fromSnapshot(doc)).toList());
    });
  }

  Stream<List<UserModel>> getUsers() {
    return fireStore.collection('users').snapshots().map((snapshot) {
      return (snapshot.docs.map((doc) => UserModel.fromSnapShot(doc)).toList());
    });
  }

  Future<void> addProduct(Product product) async {
    final docProduct = fireStore.collection('products').doc();
    try {
      await docProduct.set(product.toMap(docProduct));
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
    Get.showSnackbar(const GetSnackBar(
      message: 'item added successfully',
    ));
  }

  Future<void> updateOrderStatus(
      Order order, String field, dynamic value) async {
    await fireStore
        .collection('orders')
        .where('id', isEqualTo: order.id)
        .get()
        .then((snap) => snap.docs.first.reference.update({field: value}));
  }

  Future<void> updateProduct(
      Product product, String field, dynamic value) async {
    await fireStore
        .collection('products')
        .where('id', isEqualTo: product.id)
        .get()
        .then((snap) => snap.docs.first.reference.update({field: value}));
  }
}
