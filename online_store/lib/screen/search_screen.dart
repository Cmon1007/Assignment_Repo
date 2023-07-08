import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:online_store/model/product_info.dart';
import 'package:online_store/screen/full_product_detail.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchcontrol=TextEditingController();
  String searcheddata="";
  List<ProductInfo> searchresult=[];
  @override
  void initState() {
    searchresult=Provider.of<ProductProvider>(context,listen: false).products;
    super.initState();
  }
  @override
  void dispose() {
    searchcontrol.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider=Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search Screen"),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchcontrol,
                onChanged: (value) {
                  setState(() {
                    searcheddata=value;
                    searchresult=productProvider.products.where(
                            (product) => product.name.toLowerCase().contains(searcheddata.toLowerCase())).toList();
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search Products",
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6),fontSize: 20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(25),
                  ),
                  suffixIcon: const Icon(Icons.search,size: 30,color: Colors.black,),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  focusColor: Colors.black,
                  iconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.blueGrey.withOpacity(0.2)
                ),
              ),
            ),
            Expanded(
                child:ListView.builder(
                  itemCount: searchresult.length,
                    itemBuilder: (context, index) {
                    final product=searchresult[index];
                          return GestureDetector(
                            child: Container(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width:250,
                                    height: 200,
                                    child: Image.network(product.image),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 300,
                                      child: Container(
                                          decoration: BoxDecoration(color: Color(0xffB4CDE6),
                                          borderRadius: BorderRadius.circular(17),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 2.0),
                                            child: Column(
                                              children: [
                                                Text(product.name,textAlign: TextAlign.center,),
                                                const SizedBox(height: 5,),
                                                Text("\$ ${product.price}",style: TextStyle(fontSize: 18),)
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Get.to(()=>FullProductDetailScreen(productDetail: product));
                            },
                          );
                    },),
            ),
          ],
        ),
      ),
    );

  }
}
