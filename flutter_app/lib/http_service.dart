import 'dart:convert';
import 'package:http/http.dart';

import 'models/product.dart';
import 'models/products.dart';

class HttpService {
  final String productsURL = "https://hackzurich-api.migros.ch/products?limit=50&offset=0&facet_sort_order=asc&sort=score&order=asc&region=national&view=browse&custom_image=false";
  final String username = 'hackzurich2020';
  final String password = 'uhSyJ08KexKn4ZFS';

  Future<List<Product>> getProducts() async {
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

    Response res = await get(productsURL, headers: <String, String>{'authorization': basicAuth});

    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(res.body);
      Products products =  Products.fromJson(body);

      return products.products;
    } else {
      throw "Can't get products.";
    }
  }
}