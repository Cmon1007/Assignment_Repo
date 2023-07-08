import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:online_store/model/product_info.dart';
class FullProductDetailScreen extends StatelessWidget {
  final ProductInfo productDetail;
  const FullProductDetailScreen({
    required this.productDetail,
    Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product Detail"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Color(0xffF2F4F7),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xff2185D5),
                    ),
                  ),
                  height: 300,
                  width: 220,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.network(productDetail.image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff929AAB).withOpacity(0.2),
                border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(productDetail.name,
                      style: TextStyle(color: Color(0xff3C4048),fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Color(0xff21209C))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:4.0,vertical: 4.0),
                                      child: Text(productDetail.description,
                                        style: TextStyle(fontSize: 15,color: Color(0xff1F3C88)),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Text("\$ ${productDetail.price}",
                    style: TextStyle(fontSize: 20,color: Color(0xff3C4048)),),
                  ],
                ),
              ),
            ),
            Expanded(child:
            Column(
              children: [
                ElevatedButton(
                  style:ElevatedButton.styleFrom(backgroundColor: Color(0xff50577A),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                  ),
                    fixedSize: Size(340, 55)
                  ),
                  onPressed: (){
                    Get.showSnackbar(
                      GetSnackBar(
                        backgroundColor: Color(0xff50577A),
                      duration: Duration(seconds: 2),
                        snackPosition: SnackPosition.TOP,
                        titleText: Text(" Success",
                          style: TextStyle(
                              color: Colors.white,),
                          textAlign: TextAlign.center,),
                        messageText: Text("Added to Cart",
                          style: TextStyle(
                              color: Colors.white),
                          textAlign: TextAlign.center,),
                      ),

                    );
                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart,size: 30),
                    const SizedBox(width: 10,),
                    Text("Add to cart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                ),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
