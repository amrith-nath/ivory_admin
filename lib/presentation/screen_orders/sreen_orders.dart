import 'package:flutter/material.dart';
import 'package:ivory_admin/controllers/product_controllers.dart';
import 'package:ivory_admin/models/order_model.dart';
import 'package:intl/intl.dart';

class ScreenOrders extends StatelessWidget {
  ScreenOrders({super.key});
  ProductController productController = ProductController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: Order.orders.length,
                itemBuilder: (context, index) {
                  return OrderCard(
                    order: Order.orders[index],
                    controller: productController,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  Order order;
  ProductController controller;
  OrderCard({super.key, required this.order, required this.controller});

  @override
  Widget build(BuildContext context) {
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
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
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
          onPressed: !order.isAccepted ? () {} : null,
          child: const Text('Approve'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: !order.isAccepted ? () {} : null,
          child: const Text('Reject'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: order.isAccepted ? () {} : null,
          child: const Text('Shipped'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: order.isShiped ? () {} : null,
          child: const Text('Deliverd'),
        ),
      ],
    );
  }
}
