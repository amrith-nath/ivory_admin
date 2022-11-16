import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ivory_admin/controllers/product_controllers.dart';
import 'package:ivory_admin/services/storage_services/storage_services.dart';

class ImageController extends GetxController {
  StorageService storageService = StorageService();
  ProductController productController = Get.put(ProductController());

  XFile? image_1;
  XFile? image_2;
  XFile? image_3;
  XFile? image_4;
  ImagePicker picker = ImagePicker();
  List<XFile> images = [];

  void pickImage() async {
    List<XFile> tempImages = await picker.pickMultiImage();

    if (tempImages.length == 4) {
      images = tempImages;
      image_1 = tempImages[0];
      image_2 = tempImages[1];
      image_3 = tempImages[2];
      image_4 = tempImages[3];
      productController.isImageLoading = true;
      productController.update();
      await storageService.uploadImage(tempImages);
      List<String> downloadImage =
          await storageService.downloadImage(tempImages);
      productController.newProduct.update('images', (_) => downloadImage,
          ifAbsent: () => downloadImage);
      productController.isImageLoading = false;

      productController.update();
    } else if (tempImages.length < 4) {
      Get.snackbar(
        'Error',
        'You need to select 4 images',
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
        borderRadius: 5,
      );
    } else if (tempImages.length > 4) {
      Get.snackbar(
        'Error',
        'Select only 4 images',
        colorText: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
        borderRadius: 5,
      );
    }
  }
}
