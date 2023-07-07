import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:online_store/provider/product_provider.dart';
import 'package:online_store/screen/home_screen.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ProductProvider(),
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Online Store",
      home: HomeScreen(),
    ),
    );
  }
}
