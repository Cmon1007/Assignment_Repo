import 'package:flutter/material.dart';
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
        backgroundColor: Colors.orangeAccent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
            Text(productDetail.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 100,
                  decoration: BoxDecoration(color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:4.0),
                              child: Text(productDetail.description,
                                style: TextStyle(fontSize: 15,),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Text("\$ ${productDetail.price}"),

          ],
        ),
      ),
    );
  }
}
