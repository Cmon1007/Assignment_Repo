import 'dart:math';

import 'package:flutter/material.dart';
import 'package:online_store/model/product_info.dart';
import 'package:online_store/model/service/api_call.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductInfo> productdetails=[];
  @override
  void initState() {
    super.initState();
    GetProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 6,
          mainAxisSpacing: 4,
          mainAxisExtent: 200,
        ),
        itemCount: productdetails.length,
          itemBuilder: (BuildContext context,int index){
          final productdetail=productdetails[index];
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18)),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)
                    ),
                      child: Image.network(productdetail.image,
                        height: 120,
                      width: double.infinity,
                        fit: BoxFit.contain,

                      ),
                  ),
                  const SizedBox(height: 5,),
                  Text(productdetail.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,),
                  const SizedBox(height: 5,),
                  Text("\$ ${productdetail.price}"),
                ],
              ),
            ),
          );
      },
      ),
    );
  }
  Future<void> GetProduct() async
  {
    final response=await ApiCalling.GetApiData();
    setState(() {
      productdetails=response;
    });
  }
}
