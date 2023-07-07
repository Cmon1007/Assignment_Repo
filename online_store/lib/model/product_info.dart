import 'package:flutter/foundation.dart';

class ProductInfo
{
  final String name;
  final String price;
  final String image;
  final String description;
  ProductInfo({
  required this.name,
    required this.image,
    required this.price,
    required this.description,
});
  factory ProductInfo.fromMap(Map<String,dynamic> json)
  {
    return ProductInfo(
        name: json['title'] ,
        image: json['image'],
        price: json['price'].toString(),
      description: json['description'],
    );
  }
}