import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firestore;
import 'package:image_picker/image_picker.dart';

class StorageService {
  final firestore.FirebaseStorage storage = firestore.FirebaseStorage.instance;

  Future<void> uploadImage(List<XFile> images) async {
    for (XFile image in images) {
      await storage
          .ref('products/images/${image.name}')
          .putFile(File(image.path));
    }
  }

  Future<void> uploadBannerImage(XFile image) async {
    await storage
        .ref('products/images/${image.name}')
        .putFile(File(image.path));
  }

  Future<List<String>> downloadImage(List<XFile> images) async {
    List<String> imageUrls = [];

    for (XFile image in images) {
      String url =
          await storage.ref('products/images/${image.name}').getDownloadURL();
      imageUrls.add(url);
    }

    return imageUrls;
  }

  Future<String> downloadBannerImage(XFile image) async {
    String url =
        await storage.ref('products/images/${image.name}').getDownloadURL();

    return url;
  }
}
