
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Product.dart';

class CustomWidget extends StatefulWidget {
  final Product product;
  final List<Product> cart;

  CustomWidget({required this.product, required this.cart});

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    final added = p.quantity > 0;

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(p.icon, size: 70, color: Colors.teal),
          Text(
            p.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("\$${p.price}"),
          const SizedBox(height: 8),

          ElevatedButton(
            onPressed: () {
              if (!added) {
                setState(() {
                  p.quantity = 1;
                  if (!widget.cart.contains(p)) {
                    widget.cart.add(p);
                  }
                });
              } else {
                setState(() {
                  p.quantity = 0;
                  widget.cart.remove(p);
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: added ? Colors.redAccent : Colors.teal,
              foregroundColor: Colors.white,
            ),
            child: Text(added ? "Added ✓" : "Add to Cart"),
          ),
        ],
      ),
    );
  }
}
