// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Banner extends Equatable {
  final String tag;
  final String image;
  const Banner({
    required this.tag,
    required this.image,
  });

  Banner copyWith({
    String? tag,
    String? image,
  }) {
    return Banner(
      tag: tag ?? this.tag,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap(DocumentReference docbanner) {
    return <String, dynamic>{
      'tag': tag,
      'image': image,
    };
  }

  factory Banner.fromSnapshot(DocumentSnapshot snap) {
    return Banner(
      tag: snap['tag'] as String,
      image: snap['image'] as String,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [tag, image];
}
