// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:core';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String category;
  final List<String> colors;
  final String description;
  final List<String> images;
  final String mainCategory;
  final String name;
  final int noOfRating;
  final double price;
  final int quantity;
  final double rating;
  final List<String> size;

  const Product({
    required this.category,
    required this.colors,
    required this.description,
    required this.images,
    required this.mainCategory,
    required this.name,
    required this.noOfRating,
    required this.price,
    required this.quantity,
    required this.rating,
    required this.size,
  });

  @override
  List<Object> get props {
    return [
      category,
      colors,
      description,
      images,
      mainCategory,
      name,
      noOfRating,
      price,
      quantity,
      rating,
      size,
    ];
  }

  Product copyWith({
    String? category,
    List<String>? colors,
    String? description,
    List<String>? images,
    String? mainCategory,
    String? name,
    int? noOfRating,
    double? price,
    int? quantity,
    double? rating,
    List<String>? size,
  }) {
    return Product(
      category: category ?? this.category,
      colors: colors ?? this.colors,
      description: description ?? this.description,
      images: images ?? this.images,
      mainCategory: mainCategory ?? this.mainCategory,
      name: name ?? this.name,
      noOfRating: noOfRating ?? this.noOfRating,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      rating: rating ?? this.rating,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'colors': colors,
      'description': description,
      'images': images,
      'mainCategory': mainCategory,
      'name': name,
      'noOfRating': noOfRating,
      'price': price,
      'quantity': quantity,
      'rating': rating,
      'size': size,
    };
  }

  factory Product.fromsnapshot(DocumentSnapshot snapshot) {
    return Product(
      category: snapshot['category'] as String,
      colors: List.from((snapshot['colors'])),
      description: snapshot['description'] as String,
      images: List.from((snapshot['images'])),
      mainCategory: snapshot['mainCategory'] as String,
      name: snapshot['name'] as String,
      noOfRating: snapshot['noOfRating'] as int,
      price: double.parse(snapshot['price'].toString()),
      quantity: snapshot['quantity'] as int,
      rating: double.parse(snapshot['rating'].toString()),
      size: List<String>.from((snapshot['size'])),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;
}
