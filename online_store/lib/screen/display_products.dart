import 'package:flutter/material.dart';
class DisplayProduct extends StatelessWidget {
  const DisplayProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          children: [
          Container(
            decoration: BoxDecoration(color: Colors.orangeAccent),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 100,
                      height: 120,
                      child: Image.asset("assets/images/tshirt.png",fit: BoxFit.fill),
                  ),
                  Text("Adidas Tshirt",style: TextStyle(fontSize: 20,),)

                ],
              ),
            ),
          ),
      ]
        ),
      ),
    );
  }
}
