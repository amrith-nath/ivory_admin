// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:core';

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

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      category: map['category'] as String,
      colors: List<String>.from((map['colors'] as List<String>)),
      description: map['description'] as String,
      images: List<String>.from((map['images'] as List<String>)),
      mainCategory: map['mainCategory'] as String,
      name: map['name'] as String,
      noOfRating: map['noOfRating'] as int,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
      rating: map['rating'] as double,
      size: List<String>.from((map['size'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  static List<Product> products = [
    Product(
        category: 'fasion',
        colors: [
          '1E212B',
          '4D8B31',
          'E09F3E',
          '335C67',
        ],
        description:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi ',
        images: [
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        ],
        mainCategory: 'men',
        name: 'Spring Dress',
        noOfRating: 0,
        price: 2400,
        quantity: 10,
        rating: 0,
        size: ['s', 'm', 'l', 'xl']),
    Product(
        category: 'fasion',
        colors: [
          '1E212B',
          '4D8B31',
          'E09F3E',
          '335C67',
        ],
        description:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi ',
        images: [
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        ],
        mainCategory: 'men',
        name: 'Spring Dress',
        noOfRating: 0,
        price: 2400,
        quantity: 10,
        rating: 0,
        size: ['s', 'm', 'l', 'xl']),
    Product(
        category: 'fasion',
        colors: [
          '1E212B',
          '4D8B31',
          'E09F3E',
          '335C67',
        ],
        description:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi ',
        images: [
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        ],
        mainCategory: 'men',
        name: 'Spring Dress',
        noOfRating: 0,
        price: 2400,
        quantity: 10,
        rating: 0,
        size: ['s', 'm', 'l', 'xl']),
    Product(
        category: 'fasion',
        colors: [
          '1E212B',
          '4D8B31',
          'E09F3E',
          '335C67',
        ],
        description:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi ',
        images: [
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        ],
        mainCategory: 'men',
        name: 'Spring Dress',
        noOfRating: 0,
        price: 2400,
        quantity: 10,
        rating: 0,
        size: ['s', 'm', 'l', 'xl']),
    Product(
        category: 'fasion',
        colors: [
          '1E212B',
          '4D8B31',
          'E09F3E',
          '335C67',
        ],
        description:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi ',
        images: [
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        ],
        mainCategory: 'men',
        name: 'Spring Dress',
        noOfRating: 0,
        price: 2400,
        quantity: 10,
        rating: 0,
        size: ['s', 'm', 'l', 'xl']),
    Product(
        category: 'fasion',
        colors: [
          '1E212B',
          '4D8B31',
          'E09F3E',
          '335C67',
        ],
        description:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi ',
        images: [
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        ],
        mainCategory: 'men',
        name: 'Spring Dress',
        noOfRating: 0,
        price: 2400,
        quantity: 10,
        rating: 0,
        size: ['s', 'm', 'l', 'xl']),
    Product(
        category: 'fasion',
        colors: [
          '1E212B',
          '4D8B31',
          'E09F3E',
          '335C67',
        ],
        description:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi ',
        images: [
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        ],
        mainCategory: 'men',
        name: 'Spring Dress',
        noOfRating: 0,
        price: 2400,
        quantity: 10,
        rating: 0,
        size: ['s', 'm', 'l', 'xl']),
    Product(
        category: 'fasion',
        colors: [
          '1E212B',
          '4D8B31',
          'E09F3E',
          '335C67',
        ],
        description:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi ',
        images: [
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        ],
        mainCategory: 'men',
        name: 'Spring Dress',
        noOfRating: 0,
        price: 2400,
        quantity: 10,
        rating: 0,
        size: ['s', 'm', 'l', 'xl']),
    Product(
        category: 'fasion',
        colors: [
          '1E212B',
          '4D8B31',
          'E09F3E',
          '335C67',
        ],
        description:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi ',
        images: [
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        ],
        mainCategory: 'men',
        name: 'Spring Dress',
        noOfRating: 0,
        price: 2400,
        quantity: 10,
        rating: 0,
        size: ['s', 'm', 'l', 'xl']),
    Product(
        category: 'fasion',
        colors: [
          '1E212B',
          '4D8B31',
          'E09F3E',
          '335C67',
        ],
        description:
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi ',
        images: [
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
          'https://images.unsplash.com/photo-1622625841997-dfbffc98f4c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        ],
        mainCategory: 'men',
        name: 'Spring Dress',
        noOfRating: 0,
        price: 2400,
        quantity: 10,
        rating: 0,
        size: ['s', 'm', 'l', 'xl']),
  ];
}
