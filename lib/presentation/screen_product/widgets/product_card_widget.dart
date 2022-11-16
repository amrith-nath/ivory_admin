import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivory_admin/controllers/product_controllers.dart';

import '../../../models/product_models.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {Key? key,
      required this.product,
      required this.onDelete,
      required this.onEdit})
      : super(key: key);

  final Product product;
  final Function() onDelete;
  final Function() onEdit;

  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    TextEditingController priceController =
        TextEditingController(text: product.price.toString());
    TextEditingController quantityController =
        TextEditingController(text: product.quantity.toString());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 00),
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: Card(
        elevation: 20,
        color: Colors.grey.shade300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                productImageCard(product.images[0]),
                productImageCard(product.images[1]),
                productImageCard(product.images[2]),
                productImageCard(product.images[3]),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    productColorWidget(product.colors[0]),
                    productColorWidget(product.colors[1]),
                    productColorWidget(product.colors[2]),
                    productColorWidget(product.colors[3]),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    productSizeWidget(product.size[0]),
                    productSizeWidget(product.size[1]),
                    productSizeWidget(product.size[2]),
                    productSizeWidget(product.size[3]),
                  ],
                ),
                const Spacer(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'MainCatagory',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Catagory',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Rating',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'No of Rating',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Quantity',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(product.mainCategory.toUpperCase()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(product.category.toUpperCase()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(product.name.toUpperCase()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text("${product.price}".toUpperCase()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text("${product.rating}".toUpperCase()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text("${product.noOfRating}".toUpperCase()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text("${product.quantity}".toUpperCase()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textFieldWidget(100, 50, 'Price', priceController),
                        textFieldWidget(
                            100, 50, 'Quantity', quantityController),
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {
                              productController.updateProduct(product, 'price',
                                  double.parse(priceController.text));

                              productController.updateProduct(
                                  product,
                                  'quantity',
                                  double.parse(quantityController.text));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            child: const Text(
                              'Update',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 120,
                        child: ElevatedButton.icon(
                          onPressed: onDelete,
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red.shade400,
                          ),
                          label: Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.red.shade400,
                            ),
                          ),
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
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
          keyboardType: TextInputType.number,
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

  Padding productColorWidget(String color) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Color(int.parse("0xff$color")),
      ),
    );
  }

  Padding productSizeWidget(String size) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 10),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.black,
        child: Text(
          size.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  SizedBox productImageCard(String image) {
    return SizedBox(
      height: 100,
      width: 80,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        child: Image(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
