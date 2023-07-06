import 'package:flutter/foundation.dart';

class ProductInfo
{
  final String name;
  final String price;
  final String image;
  ProductInfo({
  required this.name,
    required this.image,
    required this.price,
});
  factory ProductInfo.fromMap(Map<String,dynamic> json)
  {
    return ProductInfo(
        name: json['title'] ,
        image: json['image'],
        price: json['price'].toString(),
    );
  }
}