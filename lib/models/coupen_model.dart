// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Coupenn extends Equatable {
  final String code;
  final double amount;
  const Coupenn({
    required this.code,
    required this.amount,
  });

  Coupenn copyWith({
    String? code,
    double? amount,
  }) {
    return Coupenn(
      code: code ?? this.code,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'amount': amount,
    };
  }

  factory Coupenn.fromSnapshot(DocumentSnapshot snap) {
    return Coupenn(
      code: snap['code'] as String,
      amount: snap['amount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [code, amount];
}
