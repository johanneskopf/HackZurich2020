import 'package:flutter_app/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/product_detail.dart';

import 'models/product.dart';

class ProductsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: FutureBuilder(
        future: httpService.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            List<Product> products = snapshot.data;
            return ListView(
              children: products
                  .map(
                    (Product product) => ListTile(
                  title: Text(product.name),
                  subtitle: Text("${product.id}"),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductDetail(
                        product: product,
                      ),
                    ),
                  ),
                ),
              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}