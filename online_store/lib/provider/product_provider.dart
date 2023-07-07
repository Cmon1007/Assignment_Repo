import 'package:flutter/foundation.dart';
import 'package:online_store/service/api_call.dart';

import '../model/product_info.dart';

class ProductProvider extends ChangeNotifier
{
  final _apicall=ApiCalling();
  List<ProductInfo> _products=[];
  List<ProductInfo> get products=>_products;

  Future<void> getAllProducts() async
  {
    final response= await _apicall.GetApiData();
    _products=response;
    notifyListeners();
  }
}