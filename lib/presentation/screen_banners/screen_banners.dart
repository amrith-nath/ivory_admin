import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivory_admin/controllers/banner_controller.dart';
import 'package:ivory_admin/models/banner_model.dart' as ban;
import 'package:ivory_admin/services/database_services/database_service.dart';

class ScreenBanners extends StatelessWidget {
  ScreenBanners({super.key});

  BannerController bannerController = Get.put(BannerController());
  DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banners'),
      ),
      body: Column(
        children: [
          GetBuilder(
              init: BannerController(),
              builder: (banner) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: banner.newBanner['image'] != null
                            ? Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      banner.newBanner['image'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Center(
                                  child: !banner.isImageLoading
                                      ? const Text(
                                          'Banner Image',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        )
                                      : const CircularProgressIndicator(
                                          color: Colors.black,
                                        ),
                                ),
                              ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {
                        bannerController.pickImage();
                      },
                      child: const Text('Upload Banner Image'),
                    ),
                    textFieldWidget(400, 50, 'Tag'),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: banner.newBanner['image'] != null
                          ? () {
                              if (banner.newBanner['tag'] != null) {
                                databaseService.addBanner(ban.Banner(
                                    tag: banner.newBanner['tag'],
                                    image: banner.newBanner['image']));
                              }
                            }
                          : null,
                      child: const Text('Upload Banner'),
                    ),
                  ],
                );
              }),
          Expanded(
              child: Obx(
            () => ListView.builder(
                itemCount: bannerController.banners.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                                bannerController.banners[index].image),
                            fit: BoxFit.cover,
                          )),
                        ),
                        Container(
                          height: 60,
                          decoration: const BoxDecoration(),
                          child: Row(children: [
                            Text(
                              bannerController.banners[index].tag,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }

  SizedBox textFieldWidget(double width, double height, String label,
      {int? lines}) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        child: TextFormField(
          maxLines: lines ?? 1,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide()),
              border: const OutlineInputBorder(borderSide: BorderSide()),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.only(
                left: 5,
                top: 10,
              ),
              labelText: label,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black,
              )),
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 15,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
          ),
          onChanged: (value) {
            bannerController.newBanner
                .update('tag', (_) => value, ifAbsent: () => value);
            bannerController.update();
          },
        ),
      ),
    );
  }
}
