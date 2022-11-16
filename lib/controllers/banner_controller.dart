import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ivory_admin/models/banner_model.dart';
import 'package:ivory_admin/services/database_services/database_service.dart';

import '../services/storage_services/storage_services.dart';

class BannerController extends GetxController {
  DatabaseService databaseService = DatabaseService();
  StorageService storageService = StorageService();

  ImagePicker picker = ImagePicker();
  var banners = <Banner>[].obs;
  var newBanner = {}.obs;

  var isImageLoading = false;

  @override
  void onInit() {
    banners.bindStream(databaseService.getBanners());
    super.onInit();
  }

  pickImage() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      isImageLoading = true;
      update();
      await storageService.uploadBannerImage(image);
      var imageUrl = await storageService.downloadBannerImage(image);
      newBanner.update('image', (_) => imageUrl, ifAbsent: () => imageUrl);
      isImageLoading = false;

      update();
    }
  }

  get image => newBanner['image'];
  get tag => newBanner['tag'];
}
