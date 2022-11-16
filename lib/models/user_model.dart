// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String image;
  final String name;
  final String email;
  const UserModel({
    required this.id,
    required this.image,
    required this.name,
    required this.email,
  });

  UserModel copyWith({
    String? id,
    String? image,
    String? name,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromSnapShot(DocumentSnapshot snap) {
    return UserModel(
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
  List<Object> get props => [id, image, name, email];
}
