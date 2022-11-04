import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivory_admin/controllers/product_controllers.dart';
import 'package:ivory_admin/presentation/screen_add_product/widgets/dropdown_widget.dart';

import '../../models/product_models.dart';

class ScreenAddProduct extends StatelessWidget {
  ScreenAddProduct({Key? key, this.product}) : super(key: key);
  final Product? product;

  final ProductController productController = Get.put(ProductController());

  late ValueNotifier<String> mainCatagoryNotify;
  late ValueNotifier<String> categoryNotify;
  late TextEditingController nameController;
  late TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    mainCatagoryNotify = product == null
        ? ValueNotifier("Choose Main catagory")
        : ValueNotifier(product!.mainCategory);
    categoryNotify = product == null
        ? ValueNotifier("Choose catagory")
        : ValueNotifier(product!.category);
    nameController = product == null
        ? TextEditingController()
        : TextEditingController(text: product!.name);
    descriptionController = product == null
        ? TextEditingController()
        : TextEditingController(text: product!.description);

    final List<String> mainCatagory = ['Men', 'Women', 'Kids'];

    final List<String> subCategory = [
      'Fasion',
      'Shoes',
      'Shoes',
      'Bags',
      'Watches',
    ];

    return Scaffold(
      appBar: AppBar(
        title: product == null
            ? const Text('Add Product')
            : const Text('Edit Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  imageCardWidget(width, 'image 1', product?.images[0]),
                  imageCardWidget(width, 'image 2', product?.images[1]),
                  imageCardWidget(width, 'image 3', product?.images[2]),
                  imageCardWidget(width, 'image 4', product?.images[3]),
                ],
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: Text(
                    'Product Information',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  productInfoTextField("Product Name", nameController),
                  productInfoTextField("Description", descriptionController),
                  Row(
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: productPriceSlider(productController, 23),
                      ),
                      const Text(
                        'Price',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        width: width / 1.5,
                        child: DropDownWidget(
                            valueNotifier: categoryNotify,
                            itemWidgetBuilder: (index, item) {
                              return DropDownItem(item: item);
                            },
                            children: subCategory,
                            onChanged: (value) {
                              categoryNotify.value = value;
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: SizedBox(
                        width: width / 1.5,
                        child: DropDownWidget(
                            valueNotifier: mainCatagoryNotify,
                            itemWidgetBuilder: (index, item) {
                              return DropDownItem(item: item);
                            },
                            children: mainCatagory,
                            onChanged: (value) {
                              mainCatagoryNotify.value = value;
                            }),
                      ),
                    ),
                  ]),
            ),
            Row(
              children: [
                colorTextField(color: product?.colors[0]),
                colorTextField(color: product?.colors[1]),
                colorTextField(color: product?.colors[2]),
                colorTextField(color: product?.colors[3]),
              ],
            ),
            Container(
              width: width,
              height: 50,
              margin: const EdgeInsets.all(30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {},
                child: product == null
                    ? const Text('Add Product')
                    : const Text('Update Product'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Slider productPriceSlider(
    ProductController controller,
    double? controllerValue,
  ) {
    return Slider(
      activeColor: Colors.black,
      inactiveColor: Colors.grey,
      divisions: 140,
      max: 5000,
      value: controllerValue ?? 0,
      onChanged: (value) {},
    );
  }

  Padding colorTextField({String? color}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color == null
                ? const Color(0xff000000)
                : Color(int.parse('0xff$color')),
          ),
          SizedBox(
            width: 55,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Color 1',
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding productInfoTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  Column imageCardWidget(double width, String hintText, String? image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width / 5,
          height: 100,
          child: Card(
              color: Colors.grey.shade400,
              child: product == null
                  ? const SizedBox()
                  : Image(
                      image: NetworkImage(image!),
                    )),
        ),
        SizedBox(
            width: width / 5,
            child: TextFormField(
              decoration: InputDecoration(labelText: hintText),
            ))
      ],
    );
  }
}
