import 'dart:html';

import 'package:get/get.dart';
import 'package:ivory_admin/models/order_model.dart';
import 'package:ivory_admin/services/database_services/database_service.dart';

class OrderController extends GetxController {
  DatabaseService databaseService = DatabaseService();

  var orders = <Order>[].obs;

  @override
  void onInit() {
    orders.bindStream(databaseService.getOrders());
    super.onInit();
  }
}
