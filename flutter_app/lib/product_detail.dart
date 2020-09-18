import 'package:flutter/material.dart';

import 'models/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product.name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Title"),
                        subtitle: Text(product.name),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text("${product.id}"),
                      ),
                      ListTile(
                        title: Text("Price"),
                        subtitle: Text("${product.price}"),
                      ),
                      ListTile(
                        title: Text("Allergen Text"),
                        subtitle: Text("${product.allergenText}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}