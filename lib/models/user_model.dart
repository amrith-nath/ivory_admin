// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String image;
  final String name;
  final String email;
  final Map address;
  const UserModel({
    required this.id,
    required this.image,
    required this.name,
    required this.email,
    required this.address,
  });

  UserModel copyWith({
    String? id,
    String? image,
    String? name,
    String? email,
    Map? address,
  }) {
    return UserModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }

  Map<String, Object> toDocument() {
    return <String, Object>{
      'id': id,
      'image': image,
      'name': name,
      'email': email,
      'address': address,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
      'email': email,
      'address': address,
    };
  }

  factory UserModel.fromSnapShot(DocumentSnapshot snap) {
    return UserModel(
      address: snap['address'] as Map<String, String>,
      id: snap['id'] as String,
      image: snap['image'] as String,
      name: snap['name'] as String,
      email: snap['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      image,
      name,
      email,
      address,
    ];
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      image: map['image'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      address: Map.from((map['address'] as Map)),
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
