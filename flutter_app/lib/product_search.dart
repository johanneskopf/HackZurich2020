import 'package:flutter_app/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/product_detail.dart';
import 'Globals.dart';
import 'models/product.dart';

class ProductSearchPage extends StatefulWidget {
  final int groceryListId;
  final int groceryListItemId;

  ProductSearchPage(this.groceryListId, this.groceryListItemId);

  @override
  _ProductSearchWidgetState createState() =>
      _ProductSearchWidgetState(groceryListId, groceryListItemId);
}

class _ProductSearchWidgetState extends State<ProductSearchPage> {
  final int groceryListId;
  final int groceryListItemId;

  _ProductSearchWidgetState(this.groceryListId, this.groceryListItemId);

  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: FutureBuilder(
        future: httpService.getProductsByName(
            GroceryLists[groceryListId].items[groceryListItemId].name, 50),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            List<Product> products = snapshot.data;
            return GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this would produce 2 rows.
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              children: products
                  .map((Product product) => Center(
                          child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3.0),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: Image.network(product.image.original),
                              //.replaceFirst("{stack}", "small")
                              height: 250,
                              width: double.infinity,
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: InkWell(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                      borderRadius: BorderRadius.all(
                                          const Radius.circular(10.0))),
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      '${product.name}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  GroceryLists[groceryListId]
                                      .items[groceryListItemId]
                                      .BoughtProduct(product);
                                  // setState(() {});
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      )))
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
