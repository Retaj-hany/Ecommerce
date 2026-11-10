
import 'package:flutter/material.dart';

import 'Product.dart';
 late List<Product> products;
class cartPage extends StatefulWidget {
  final List<Product> products;

  cartPage({required this.products});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  @override
  Widget build(BuildContext context) {
    double total = 0;

    for (var p in widget.products) {
      total += p.quantity * p.price;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 216, 164, 251),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.products.length,
              itemBuilder: (context, index) {
                final p = widget.products[index];

                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 10,
                  child: ListTile(
                    leading: Icon(
                      p.icon,
                      size: 40,
                      color: const Color.fromARGB(255, 82, 88, 239),
                    ),

                    title: Text(
                      p.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Text("Price: \$${p.price}"),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (p.quantity > 1) {
                                p.quantity--;
                              } else {
                                p.quantity = 0;
                                widget.products.removeAt(index);
                              }
                            });
                          },
                        ),

                        Text(
                          "${p.quantity}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              p.quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color:const Color.fromARGB(255, 216, 164, 251),
            ),
            child: Center(
              child: Text(
                "Total: \$${total}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
