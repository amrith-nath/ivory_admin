// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ivory_admin/controllers/order_controller.dart';

import 'package:ivory_admin/controllers/product_controllers.dart';
import 'package:ivory_admin/models/order_model.dart';

class ScreenOrders extends StatelessWidget {
  ScreenOrders({super.key});
  ProductController productController = Get.put(ProductController());
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ElevatedButton(
          //     onPressed: () {
          //       fireStore
          //           .collection('orders')
          //           .where('id', isEqualTo: orderController.orders[0].id)
          //           .get()
          //           .then((snap) =>
          //               snap.docs.first.reference.update({'isAccepted': true}));
          //     },
          //     child: Text('kill')),
          Expanded(
            child: Obx(
              () => ListView.builder(
                  itemCount: orderController.orders.length,
                  itemBuilder: (context, index) {
                    return OrderCard(
                      order: orderController.orders[index],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  Order order;
  final ProductController controller = Get.find();
  final OrderController orderController = Get.find();
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = controller.products.where(
      (e) {
        return order.productId.contains(e.id);
      },
    ).toList();

    // var idList = order.productId;
    // for (var a in idList) {
    //   log(a);
    // }
    // log('length  ${idList.length}');

    return Card(
      color: Colors.grey.shade200,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Id    ${order.id}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade600,
                  ),
                  Text(
                    'Order date    ${DateFormat('dd-MM-yy').format(order.orderPlacedAt)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('Delivery Fee',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Text(order.deliveryFee.toString(),
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5),
              child: Row(
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('subtotal',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Text(order.total.toString(),
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5),
              child: Row(
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text('Total',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Text((order.total + order.deliveryFee).toString(),
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image(
                          image: NetworkImage(products[index].images[0]),
                        ),
                      ),
                      Text(
                        products[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  );
                }),
            Row(
              children: const [],
            ),
            const SizedBox(
              height: 50,
            ),
            buttonWidgets(order),
          ],
        ),
      ),
    );
  }

  Row buttonWidgets(Order order) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: !order.isAccepted
              ? !order.isRejected
                  ? () {
                      orderController.updateOrderStatus(
                          order, 'isAccepted', true);
                    }
                  : null
              : null,
          child: const Text('Approve'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: !order.isRejected
              ? () {
                  orderController.updateOrderStatus(order, 'isRejected', true);
                  orderController.updateOrderStatus(order, 'isAccepted', false);
                }
              : null,
          child: const Text('Reject'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: order.isAccepted
              ? !order.isShiped
                  ? () {
                      orderController.updateOrderStatus(
                          order, 'isShiped', true);
                    }
                  : null
              : null,
          child: const Text('Shipped'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: order.isShiped
              ? !order.isDeliverd
                  ? () {
                      orderController.updateOrderStatus(
                          order, 'isDeliverd', true);
                    }
                  : null
              : null,
          child: const Text('Deliverd'),
        ),
      ],
    );
  }
}
