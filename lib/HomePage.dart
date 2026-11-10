
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CartPage.dart';
import 'Product.dart';
import 'customWidget.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final List<Product> products = [
    Product(name: "Smart Watch", price: 120.0, icon: Icons.watch),
    Product(name: "Headphones", price: 80.0, icon: Icons.headphones),
    Product(name: "Laptop", price: 950.0, icon: Icons.laptop),
    Product(name: "Camera", price: 400.0, icon: Icons.camera_alt),
    Product(name: "ٍSmartPhone", price: 500.0, icon: Icons.phone_android),
    Product(name: "Tablet", price: 400.0, icon: Icons.tablet),
    Product(name: "Bag", price: 90.0, icon: Icons.wallet_travel),
    Product(name: "Cable", price: 40.0, icon: Icons.cable),
  ];

  List<Product> cartProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 3,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            return CustomWidget(
              product: products[index],
              cart: cartProducts,
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => cartPage(products: cartProducts),
            ),
          ).then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.shopping_cart, color: Colors.teal),
      ),
    );
  }
}
