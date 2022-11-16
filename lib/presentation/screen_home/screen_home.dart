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
      body: SingleChildScrollView(
        child: Column(
          children: [
            homeContainerWidget(
                text: 'Go to Products',
                ontap: () {
                  Get.to(
                    () => ScreenProduct(),
                    duration: const Duration(milliseconds: 500),
                    transition: Transition.cupertino,
                  );
                }),
            homeContainerWidget(
                text: 'Go to Users',
                ontap: () {
                  Get.to(
                    () => ScreenUser(),
                    duration: const Duration(milliseconds: 500),
                    transition: Transition.cupertino,
                  );
                }),
            homeContainerWidget(
                text: 'Go to Orders',
                ontap: () {
                  Get.to(
                    () => ScreenOrders(),
                    duration: const Duration(milliseconds: 500),
                    transition: Transition.cupertino,
                  );
                }),
            homeContainerWidget(
                text: 'Go to Banners',
                ontap: () {
                  Get.to(
                    () => ScreenBanners(),
                    duration: const Duration(milliseconds: 500),
                    transition: Transition.cupertino,
                  );
                }),
            homeContainerWidget(
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
      ),
    );
  }

  Container homeContainerWidget(
      {required String text, required Function() ontap}) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 150,
      child: InkWell(
        onTap: ontap,
        child: Card(
          borderOnForeground: true,
          color: Colors.black,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
