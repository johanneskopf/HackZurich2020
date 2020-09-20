import 'dart:convert';
import 'package:http/http.dart';

import 'models/product.dart';
import 'models/products.dart';
import 'models/recipe.dart';
import 'models/recipes_random.dart';

typedef Future<T> FutureGenerator<T>();

class HttpService {
  final int retries = 5;
  final int retry_waittime_ms = 1000;

  final String productsURL =
      "https://hackzurich-api.migros.ch/products?limit=20&offset=0&facet_sort_order=asc&sort=score&order=asc&region=national&view=browse&custom_image=false";
  final String recipe_search_URL =
      "https://hackzurich-api.migros.ch/hack/recipe/recipes_de/_search";
  final String recipe_count_URL =
      "https://hackzurich-api.migros.ch/hack/recipe/recipes_de/_count";
  final String product_search_URL =
      "https://hackzurich-api.migros.ch/products?search={query}&limit={limit}&offset=0&facet_sort_order=asc&sort=score&order=asc&region=national&view=browse&custom_image=false";
  final String username = 'hackzurich2020';
  final String password = 'uhSyJ08KexKn4ZFS';

  Future<T> retry<T>(int retries, FutureGenerator aFuture, {Duration delay}) async {
    try {
      return await aFuture();
    } catch (e) {
      if (retries > 1) {
        if (delay != null) {
          await Future.delayed(delay);
        }
        return retry(retries - 1, aFuture);
      }
      rethrow;
    }
  }

  Future<List<Product>> getProducts() async {
    return await retry<List<Product>>(retries, getProductsOnce, delay: Duration(milliseconds: retry_waittime_ms));
  }

  Future<List<Product>> getProductsOnce() async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    Response res = await get(productsURL, headers: <String, String>{
      'authorization': basicAuth,
      'Content-Type': 'application/json'
    });
    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));
      Products products = Products.fromJson(body);
      // successful = body.containsKey("success");
      return products.products;
    } else {
        throw "Can't get products.";
    }
  }

  Future<Recipe> getRandomRecipe() async {
    return await retry<Recipe>(retries, getRandomRecipeOnce, delay: Duration(milliseconds: retry_waittime_ms));
  }

  Future<Recipe> getRandomRecipeOnce() async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    int seed = DateTime.now().millisecondsSinceEpoch; // 1477072619038;
    Response res = await post(recipe_search_URL,
        headers: <String, String>{
          'authorization': basicAuth,
          'Content-Type': 'application/json'
        },
        body:
            '{ "size": 1,"query": {"function_score": {"functions": [{"random_score": {"seed": "' +
                seed.toString() +
                '"}}]}}}'
        // json.encode( { size:)
        );

    if (res.statusCode == 200) {
      Map<String, dynamic> body =
          jsonDecode(utf8.decode(res.bodyBytes)); // res.body);
      RecipesRandom recipesRandom = RecipesRandom.fromJson(body);
      return recipesRandom.hits.hits.first.source;
    } else {
      throw "Can't get random recipe.";
    }
  }

  String storedQuery;
  int storedLimit;

  Future<List<Product>> getProductsByName(String query, int limit) async {
    storedQuery = query;
    storedLimit = limit;
    return await retry<List<Product>>(retries, getProductsByNameOnce, delay: Duration(milliseconds: retry_waittime_ms));
  }

  Future<List<Product>> getProductsByNameOnce() async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    Response res = await get(
        product_search_URL
            .replaceFirst("{query}", storedQuery)
            .replaceFirst("{limit}", storedLimit.toString()),
        headers: <String, String>{
          'authorization': basicAuth,
          'Content-Type': 'application/json'
        });

    if (res.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));
      Products products = Products.fromJson(body);
      return products.products;
    } else {
      throw "Can't get products.";
    }
  }
}
