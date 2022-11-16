import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivory_admin/presentation/screen_product/screen_product.dart';
import 'package:ivory_admin/presentation/screen_user/screen_user.dart';

import '../screen_banners/screen_banners.dart';
import '../screen_coupens/screen_coupens.dart';
import '../screen_orders/sreen_orders.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ivory Admin Panel'),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          homeCardWidget(
            text: 'Go to Products',
            icon: Icons.inventory_2_outlined,
            ontap: () {
              Get.to(
                () => ScreenProduct(),
                duration: const Duration(milliseconds: 500),
                transition: Transition.cupertino,
              );
            },
          ),
          homeCardWidget(
              icon: Icons.person,
              text: 'Go to Users',
              ontap: () {
                Get.to(
                  () => ScreenUser(),
                  duration: const Duration(milliseconds: 500),
                  transition: Transition.cupertino,
                );
              }),
          homeCardWidget(
              icon: Icons.shopping_cart_outlined,
              text: 'Go to Orders',
              ontap: () {
                Get.to(
                  () => ScreenOrders(),
                  duration: const Duration(milliseconds: 500),
                  transition: Transition.cupertino,
                );
              }),
          homeCardWidget(
              icon: Icons.add_a_photo_outlined,
              text: 'Go to Banners',
              ontap: () {
                Get.to(
                  () => ScreenBanners(),
                  duration: const Duration(milliseconds: 500),
                  transition: Transition.cupertino,
                );
              }),
          homeCardWidget(
              icon: Icons.local_offer_outlined,
              text: 'Go to Coupens',
              ontap: () {
                Get.to(
                  () => ScreenCoupens(),
                  duration: const Duration(milliseconds: 500),
                  transition: Transition.cupertino,
                );
              }),
        ],
      ),
    );
  }

  Card homeCardWidget(
      {required String text,
      required IconData icon,
      required Function() ontap}) {
    return Card(
      elevation: 10,
      color: Colors.black,
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 50,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
