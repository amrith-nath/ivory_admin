import 'package:flutter/material.dart';

import '../../../models/product_models.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.product,
      required this.onDelete,
      required this.onEdit})
      : super(key: key);

  final Product product;
  final Function() onDelete;
  final Function() onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 00),
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 490,
      child: Card(
        elevation: 20,
        color: Colors.grey.shade300,
        child: Column(
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
                    style: const TextStyle(
                      fontSize: 14,
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
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 60,
                  width: 170,
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
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 170,
                  child: ElevatedButton.icon(
                    onPressed: onEdit,
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                        Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
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
        ),
      ),
    );
  }
}
