import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final double price;
  final IconData icon;
  int quantity;

  Product({
    required this.name,
    required this.price,
    required this.icon,
    this.quantity = 0,
  });
}
