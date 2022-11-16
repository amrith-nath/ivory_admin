import 'package:get/get.dart';
import 'package:ivory_admin/models/coupen_model.dart';
import 'package:ivory_admin/services/database_services/database_service.dart';

class CoupenController extends GetxController {
  DatabaseService databaseService = DatabaseService();

  var newCoupen = {}.obs;

  var coupens = <Coupen>[].obs;

  @override
  void onInit() {
    coupens.bindStream(databaseService.getCoupens());
    super.onInit();
  }

  get code => newCoupen['code'];
  get amount => newCoupen['amount'];
}
