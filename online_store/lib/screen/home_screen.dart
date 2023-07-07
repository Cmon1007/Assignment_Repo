import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_store/model/product_info.dart';
import 'package:online_store/provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../service/api_call.dart';
import 'full_product_detail.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context,listen: false).getAllProducts();
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
      body: Consumer<ProductProvider>(builder: (context, value, child)
      {
        final productdetails=value.products;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4,
            mainAxisSpacing: 0,
            mainAxisExtent: 205,
          ),
          itemCount: productdetails.length,
          itemBuilder: (BuildContext context,int index){
            final productdetail=productdetails[index];
            return GestureDetector(
            onTap: (){
              Get.to(()=>FullProductDetailScreen(productDetail: productdetail),
              );
            },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(17),
                              bottomRight: Radius.circular(17),
                              ),
                          ),
                          child: Column(
                            children: [
                              Text(productdetail.name,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,),
                              const SizedBox(height: 5,),
                              Text("\$ ${productdetail.price}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },)


    );
  }

}
