import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:ivory_admin/controllers/image_controller.dart';
import 'package:ivory_admin/controllers/product_controllers.dart';
import 'package:ivory_admin/models/product_models.dart';
import 'package:ivory_admin/services/database_services/database_service.dart';
import '../../controllers/color_controller.dart';

class ProducrAddEditScreen extends StatelessWidget {
  ProducrAddEditScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  final ColorController colorController = Get.put(ColorController());
  final ImageController imageController = Get.put(ImageController());
  final DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
          child: Column(
            children: [
              GetBuilder(
                  init: ProductController(),
                  builder: (productController) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            imageCardWidget(
                                width,
                                'Image 1',
                                productController.newProduct['images']?[0],
                                productController.isImageLoading),
                            imageCardWidget(
                                width,
                                'Image 2',
                                productController.newProduct['images']?[1],
                                productController.isImageLoading),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            imageCardWidget(
                                width,
                                'Image 3',
                                productController.newProduct['images']?[2],
                                productController.isImageLoading),
                            imageCardWidget(
                                width,
                                'Image 4',
                                productController.newProduct['images']?[3],
                                productController.isImageLoading),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            imageController.pickImage();
                            log('${imageController.images.length}');
                          },
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 20,
                          ),
                          label: const Text('Add Images'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: const Size(250, 50),
                          ),
                        ),
                      ],
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Name and Description',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: Colors.grey.shade800,
              ),
              textFieldWidget(width / 1.1, 55, 'Name'),
              const SizedBox(
                height: 10,
              ),
              textFieldWidget(width / 1.1, 110, 'Description', lines: 8),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Price and Quality',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade800,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textFieldWidget(width / 2.3, 55, 'Price'),
                      textFieldWidget(width / 2.3, 55, 'Quantity'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade800,
                  ),
                  GetBuilder(
                      init: ProductController(),
                      builder: (productController) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                radioTileMain(width, 'Men'),
                                radioTileMain(width, 'Women'),
                                radioTileMain(width, 'Kid'),
                              ],
                            ),
                            Column(
                              children: [
                                radioTileSub(width, 'Fasion'),
                                radioTileSub(width, 'Shoes'),
                                radioTileSub(width, 'Bags'),
                                radioTileSub(width, 'Watches'),
                                radioTileSub(width, 'Toys'),
                              ],
                            ),
                          ],
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Sizes',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: Colors.grey.shade800,
              ),
              GetBuilder(
                  init: ProductController(),
                  builder: (productController) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            choiceChipWidget('xs'),
                            choiceChipWidget('s'),
                            choiceChipWidget('m'),
                            choiceChipWidget('l'),
                            choiceChipWidget('x'),
                            choiceChipWidget('xl'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            choiceChipWidget('07'),
                            choiceChipWidget('08'),
                            choiceChipWidget('09'),
                            choiceChipWidget('10'),
                          ],
                        ),
                      ],
                    );
                  }),
              Text(
                'Colors',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: Colors.grey.shade800,
              ),
              GetBuilder(
                  init: ColorController(),
                  builder: (colorController) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        colorSelectionWidget(1, colorController.color_1),
                        colorSelectionWidget(2, colorController.color_2),
                        colorSelectionWidget(3, colorController.color_3),
                        colorSelectionWidget(4, colorController.color_4),
                      ],
                    );
                  }),
              Container(
                width: width,
                height: 50,
                margin: const EdgeInsets.all(30),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () async {
                      await databaseService.addProduct(
                        Product(
                          // id: productController.newProduct['id'],
                          category: productController.newProduct['subcategory'],
                          colors: productController.newProduct['colors'],
                          description:
                              productController.newProduct['description'],
                          images: productController.newProduct['images'],
                          mainCategory:
                              productController.newProduct['mainCategory'],
                          name: productController.newProduct['name'],
                          noOfRating: 0,
                          price: double.parse(
                              productController.newProduct['price']),
                          quantity: int.parse(
                              productController.newProduct['quantity']),
                          rating: 0.0,
                          size: productController.size,
                        ),
                      );
                      Get.back();
                    },
                    child: const Text('Add Product')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ChoiceChip choiceChipWidget(String label) {
    return ChoiceChip(
      selectedColor: Colors.black,
      disabledColor: Colors.grey.shade900,
      backgroundColor: Colors.grey.shade500,
      label: Text(label.toUpperCase()),
      labelPadding: const EdgeInsets.symmetric(horizontal: 20),
      labelStyle: const TextStyle(color: Colors.white),
      onSelected: (value) {
        addChipSize(label);
      },
      selected: isContains(label),
      pressElevation: 5,
    );
  }

  bool isContains(String label) {
    if (productController.size.contains(label)) {
      return true;
    }
    return false;
  }

  addChipSize(String label) {
    if (productController.size.contains(label)) {
      productController.size.remove(label);
    } else {
      if (productController.size.length < 4) {
        productController.size.add(label);
      } else {
        Get.showSnackbar(const GetSnackBar(
          message: 'Only 4 sizes can be selected',
        ));
      }
    }
    productController.update();
  }

  SizedBox radioTileMain(double width, String value) {
    return SizedBox(
      width: width / 2.3,
      child: Card(
        child: RadioListTile(
            activeColor: Colors.black,
            title: Text(value),
            value: value,
            groupValue: productController.mainCategory,
            onChanged: (text) {
              productController.mainCategory = value.toString();
              productController.update();

              productController.newProduct.update(
                  'mainCategory', (_) => productController.mainCategory,
                  ifAbsent: () => productController.mainCategory);
            }),
      ),
    );
  }

  SizedBox radioTileSub(double width, String value) {
    return SizedBox(
      width: width / 2.3,
      child: Card(
        child: RadioListTile(
            activeColor: Colors.black,
            title: Text(value),
            value: value,
            groupValue: productController.subCategory,
            onChanged: (value) {
              productController.subCategory = value.toString();
              productController.update();
              productController.newProduct.update(
                  'subcategory', (_) => productController.subCategory,
                  ifAbsent: () => productController.subCategory);
            }),
      ),
    );
  }

  colorSelectionWidget(
    int num,
    Color color,
  ) {
    return Column(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: Colors.black,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: color,
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              pickColor(color, num);
            },
            child: Text("Color $num"))
      ],
    );
  }

  pickColor(Color color, int num) => Get.dialog(
        AlertDialog(
          title: const Text('Choose Your Color'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlockPicker(
                  pickerColor: color,
                  onColorChanged: (color) {
                    colorController.updateColor(color, num);
                    Get.back();
                  }),
            ],
          ),
        ),
      );

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
            productController.newProduct.update(
                label.toLowerCase(), (_) => value,
                ifAbsent: () => value);
          },
        ),
      ),
    );
  }

  Column imageCardWidget(
      double width, String hintText, String? image, bool isloading) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width / 2.2,
          height: 200,
          child: Card(
              elevation: 6,
              color: Colors.white,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(5)),
                  child: isloading
                      ? const SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : image == null
                          ? const SizedBox(
                              child: Center(
                                child: Text(
                                  'Pick Image',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            )
                          // : Image.file(
                          //     File(
                          //       image.path,
                          //     ),
                          //     fit: BoxFit.cover,
                          //   ),
                          : Image(
                              image: NetworkImage(image),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ))),
        ),
      ],
    );
  }
}
