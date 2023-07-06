import 'package:flutter/material.dart';
import 'package:online_store/screen/display_products.dart';
import 'package:online_store/screen/home_screen.dart';
void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Online Store",
      home: HomeScreen(),
    );
  }
}