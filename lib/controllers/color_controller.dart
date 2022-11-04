import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivory_admin/controllers/product_controllers.dart';

class ColorController extends GetxController {
  ProductController productController = Get.put(ProductController());

  List<String> productColors = [];

  Color color_1 = Colors.white;
  Color color_2 = Colors.white;
  Color color_3 = Colors.white;
  Color color_4 = Colors.white;

  void updateColor(Color color, int count) {
    switch (count) {
      case 1:
        color_1 = color;
        productColors.add(color_1.hashCode.toString());
        break;
      case 2:
        color_2 = color;
        productColors.add(color_2.hashCode.toString());

        break;
      case 3:
        color_3 = color;
        productColors.add(color_3.hashCode.toString());

        break;
      case 4:
        color_4 = color;
        productColors.add(color_4.hashCode.toString());

        break;
      default:
        color_1 = color_2 = color_3 = color_4 = color;
        break;
    }

    update();

    productController.newProduct
        .update('colors', (_) => productColors, ifAbsent: () => productColors);
    log(productColors.length.toString());
  }
}
