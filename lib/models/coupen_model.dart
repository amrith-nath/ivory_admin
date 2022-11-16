// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Coupen extends Equatable {
  final String? id;
  final String code;
  final double amount;
  const Coupen({
    this.id,
    required this.code,
    required this.amount,
  });

  Coupen copyWith({
    String? id,
    String? code,
    double? amount,
  }) {
    return Coupen(
      id: id ?? this.id,
      code: code ?? this.code,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap(DocumentReference doc) {
    return <String, dynamic>{
      'id': doc.id,
      'code': code,
      'amount': amount,
    };
  }

  factory Coupen.fromSnapshot(DocumentSnapshot snap) {
    return Coupen(
      id: snap['id'] as String,
      code: snap['code'] as String,
      amount: double.parse(snap['amount'].toString()),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [code, amount];
}
