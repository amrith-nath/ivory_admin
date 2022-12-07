import 'package:get/get.dart';
import 'package:ivory_admin/models/user_model.dart';
import 'package:ivory_admin/services/database_services/database_service.dart';

class UserController extends GetxController {
  DatabaseService databaseService = DatabaseService();
  var users = <UserModel>[].obs;

  @override
  void onInit() {
    users.bindStream(databaseService.getUsers());
    super.onInit();
  }



}
