// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String? id;
  final String customerId;
  final List<String> productId;
  final double deliveryFee;
  final double total;
  final double subTotal;
  final bool isAccepted;
  final bool isShiped;
  final bool isDeliverd;
  final bool isRejected;

  final DateTime orderPlacedAt;
  const Order({
    this.id,
    required this.customerId,
    required this.productId,
    required this.deliveryFee,
    required this.total,
    required this.subTotal,
    required this.isAccepted,
    required this.isShiped,
    required this.isDeliverd,
    required this.isRejected,
    required this.orderPlacedAt,
  });

  Order copyWith({
    String? id,
    String? customerId,
    List<String>? productId,
    double? deliveryFee,
    double? total,
    double? subTotal,
    bool? isAccepted,
    bool? isShiped,
    bool? isDeliverd,
    bool? isRejected,
    DateTime? orderPlacedAt,
  }) {
    return Order(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      productId: productId ?? this.productId,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      total: total ?? this.total,
      subTotal: subTotal ?? this.subTotal,
      isAccepted: isAccepted ?? this.isAccepted,
      isShiped: isShiped ?? this.isShiped,
      isDeliverd: isDeliverd ?? this.isDeliverd,
      isRejected: isRejected ?? this.isRejected,
      orderPlacedAt: orderPlacedAt ?? this.orderPlacedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customerid': customerId,
      'productId': productId,
      'deliveryFee': deliveryFee,
      'total': total,
      'subTotal': subTotal,
      'isAccepted': isAccepted,
      'isShiped': isShiped,
      'isDeliverd': isDeliverd,
      'orderPlacedAt': orderPlacedAt.millisecondsSinceEpoch,
    };
  }

  factory Order.fromSnapshot(DocumentSnapshot snap) {
    return Order(
      id: snap.id,
      customerId: snap['customerid'] as String,
      productId: List<String>.from((snap['productId'] as List<int>)),
      deliveryFee: snap['deliveryFee'] as double,
      total: snap['total'] as double,
      subTotal: snap['subTotal'] as double,
      isAccepted: snap['isAccepted'] as bool,
      isShiped: snap['isShiped'] as bool,
      isDeliverd: snap['isDeliverd'] as bool,
      isRejected: snap['isRejected'] as bool,
      orderPlacedAt:
          DateTime.fromMillisecondsSinceEpoch(snap['orderPlacedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id!,
      customerId,
      productId,
      deliveryFee,
      total,
      subTotal,
      isAccepted,
      isShiped,
      isDeliverd,
      orderPlacedAt,
    ];
  }

  static List<Order> orders = [
    Order(
      customerId: '2',
      productId: const ['p0ACeO2WBeVSqG7tfjr7'],
      deliveryFee: 2200,
      total: 2100,
      subTotal: 2000,
      isAccepted: false,
      isShiped: false,
      isDeliverd: false,
      isRejected: false,
      orderPlacedAt: DateTime.now(),
    ),
    Order(
      customerId: '2',
      productId: const ['p0ACeO2WBeVSqG7tfjr7', 'OibJPrhV9TJ4B0Jleqm5'],
      deliveryFee: 3300,
      total: 3400,
      subTotal: 3000,
      isAccepted: false,
      isShiped: false,
      isDeliverd: false,
      isRejected: false,
      orderPlacedAt: DateTime.now(),
    ),
  ];
}
