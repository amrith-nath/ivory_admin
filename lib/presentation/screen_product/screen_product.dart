import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivory_admin/controllers/product_controllers.dart';
import 'package:ivory_admin/models/product_models.dart';
import 'package:ivory_admin/presentation/product_add_edit_screen/product_add_edit.dart';
import 'package:ivory_admin/presentation/screen_product/widgets/product_card_widget.dart';
import 'package:ivory_admin/services/database_services/database_service.dart';

import '../screen_add_product/screen_add_product.dart';

class ScreenProduct extends StatelessWidget {
  ScreenProduct({
    Key? key,
  }) : super(key: key);
  ProductController productController = Get.put(ProductController());

  DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: const Text('Product Screen'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 0),
          //   margin: const EdgeInsets.symmetric(horizontal: 10),
          //   width: double.infinity,
          //   height: 160,
          //   child: InkWell(
          //     onTap: () {},
          //     child: const Card(
          //       borderOnForeground: true,
          //       margin: EdgeInsets.all(10),
          //       color: Colors.black,
          //       child: Center(
          //         child: Text(
          //           "Add Product",
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 24,
          //             fontWeight: FontWeight.w300,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Obx(
                () => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: productController.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(
                      onDelete: () {},
                      onEdit: () {},
                      product: productController.products[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 200,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {
            Get.to(() => ProducrAddEditScreen(),
                transition: Transition.downToUp,
                duration: const Duration(milliseconds: 400));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.add), Text('Add Product')],
          ),
        ),
      ),
    );
  }
}
