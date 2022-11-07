// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String? id;
  final int customerid;
  final List<int> productId;
  final double deliveryFee;
  final double total;
  final double subTotal;
  final bool isAccepted;
  final bool isShiped;
  final bool isDeliverd;
  final DateTime orderPlacedAt;
  const Order({
    this.id,
    required this.customerid,
    required this.productId,
    required this.deliveryFee,
    required this.total,
    required this.subTotal,
    required this.isAccepted,
    required this.isShiped,
    required this.isDeliverd,
    required this.orderPlacedAt,
  });

  Order copyWith({
    String? id,
    int? customerid,
    List<int>? productId,
    double? deliveryFee,
    double? total,
    double? subTotal,
    bool? isAccepted,
    bool? isShiped,
    bool? isDeliverd,
    DateTime? orderPlacedAt,
  }) {
    return Order(
      id: id ?? this.id,
      customerid: customerid ?? this.customerid,
      productId: productId ?? this.productId,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      total: total ?? this.total,
      subTotal: subTotal ?? this.subTotal,
      isAccepted: isAccepted ?? this.isAccepted,
      isShiped: isShiped ?? this.isShiped,
      isDeliverd: isDeliverd ?? this.isDeliverd,
      orderPlacedAt: orderPlacedAt ?? this.orderPlacedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customerid': customerid,
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

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] != null ? map['id'] as String : null,
      customerid: map['customerid'] as int,
      productId: List<int>.from((map['productId'] as List<int>)),
      deliveryFee: map['deliveryFee'] as double,
      total: map['total'] as double,
      subTotal: map['subTotal'] as double,
      isAccepted: map['isAccepted'] as bool,
      isShiped: map['isShiped'] as bool,
      isDeliverd: map['isDeliverd'] as bool,
      orderPlacedAt:
          DateTime.fromMillisecondsSinceEpoch(map['orderPlacedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id!,
      customerid,
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
      customerid: 2,
      productId: const [1, 2],
      deliveryFee: 2200,
      total: 2100,
      subTotal: 2000,
      isAccepted: false,
      isShiped: false,
      isDeliverd: false,
      orderPlacedAt: DateTime.now(),
    ),
    Order(
      customerid: 2,
      productId: const [1, 2],
      deliveryFee: 3300,
      total: 3400,
      subTotal: 3000,
      isAccepted: false,
      isShiped: false,
      isDeliverd: false,
      orderPlacedAt: DateTime.now(),
    ),
  ];
}
