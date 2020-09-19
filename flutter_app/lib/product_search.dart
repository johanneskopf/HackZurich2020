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
              // Generate 100 Widgets that display their index in the List
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
                              // decoration: new BoxDecoration(
                              //   border: new Border.all(
                              //       color: Colors.transparent, width: 1.0),
                              //   // borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
                              //   color: new Color.fromRGBO(0, 0, 0, 0.4),
                              // ),
                              // child: Text(
                              //   'Item ${product.name}',
                              //   style: TextStyle(
                              //       color: Colors.white,
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 18.0),
                              // ),
                            ),
                          ],
                        ),
                        // Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Image.network(product.image.original), //.replaceFirst("{stack}", "small")
                        //       Text(
                        //         'Item ${product.id}',
                        //         style: Theme.of(context).textTheme.headline5,
                        //       ),
                        //     ])
                      )))
                  .toList(),
            );
            // return ListView(
            //   children: products
            //       .map(
            //         (Product product) => ListTile(
            //       title: Text(product.name),
            //       subtitle: Text("${product.id}"),
            //       onTap: () => Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => ProductDetail(
            //             product: product,
            //           ),
            //         ),
            //       ),
            //     ),
            //   )
            //       .toList(),
            // );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
