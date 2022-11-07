// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final int customerid;
  final List<int> productId;
  final double paymentAmount;
  final double total;
  final double subTotal;
  final bool isAccepted;
  final bool isShiped;
  final bool isDeliverd;
  final DateTime orderPlacedAt;
  const Order({
    required this.id,
    required this.customerid,
    required this.productId,
    required this.paymentAmount,
    required this.total,
    required this.subTotal,
    required this.isAccepted,
    required this.isShiped,
    required this.isDeliverd,
    required this.orderPlacedAt,
  });

  Order copyWith({
    int? id,
    int? customerid,
    List<int>? productId,
    double? paymentAmount,
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
      paymentAmount: paymentAmount ?? this.paymentAmount,
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
      'paymentAmount': paymentAmount,
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
      id: snap['id'] as int,
      customerid: snap['customerid'] as int,
      productId: List<int>.from((snap['productId'] as List<int>)),
      paymentAmount: snap['paymentAmount'] as double,
      total: snap['total'] as double,
      subTotal: snap['subTotal'] as double,
      isAccepted: snap['isAccepted'] as bool,
      isShiped: snap['isShiped'] as bool,
      isDeliverd: snap['isDeliverd'] as bool,
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
      id,
      customerid,
      productId,
      paymentAmount,
      total,
      subTotal,
      isAccepted,
      isShiped,
      isDeliverd,
      orderPlacedAt,
    ];
  }
}
