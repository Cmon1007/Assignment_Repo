import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:online_store/model/product_info.dart';
class ApiCalling
{
   Future<List<ProductInfo>> GetApiData() async
  {
    const url="https://fakestoreapi.com/products";
    final uri=Uri.parse(url);
    final response=await http.get(uri);
    try {
      if (response.statusCode == 200)
      {
        final body = response.body;
        final json = jsonDecode(body);
        final result = json as List<dynamic>;
        final transform = result.map((e) {
          return ProductInfo.fromMap(e);
        }).toList();
        return transform;
      }
      else
        {
          throw Exception("Failed to get product data from api");
        }
    }
    catch(e)
    {
      throw Exception(e);
    }
  }
}