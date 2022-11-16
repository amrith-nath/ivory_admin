import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivory_admin/controllers/coupen_controller.dart';
import 'package:ivory_admin/models/coupen_model.dart';
import 'package:ivory_admin/services/database_services/database_service.dart';

class ScreenCoupens extends StatelessWidget {
  ScreenCoupens({super.key});

  CoupenController coupenController = Get.put(CoupenController());
  TextEditingController codeController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coupens'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                textFieldWidget(400, 50, 'Code', codeController),
                textFieldWidget(400, 50, 'Amount', amountController),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    if (codeController.text != '' &&
                        amountController.text != '') {
                      databaseService.addCoupen(Coupen(
                          code: codeController.text.toUpperCase(),
                          amount: double.parse(amountController.text)));
                    }
                  },
                  child: const Text('Upload Coupen'),
                ),
              ],
            ),
          ),
          Expanded(
              child: Obx(
            () => GridView.builder(
                itemCount: coupenController.coupens.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amber.shade300,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          coupenController.coupens[index].code,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "\$ ${coupenController.coupens[index].amount}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )),
        ],
      ),
    );
  }

  SizedBox textFieldWidget(double width, double height, String label,
      TextEditingController controller,
      {int? lines}) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        child: TextFormField(
          controller: controller,
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
          onChanged: (value) {},
        ),
      ),
    );
  }
}
