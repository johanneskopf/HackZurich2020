import 'package:flutter_app/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/product_detail.dart';

import 'models/product.dart';
import 'models/recipe.dart';

class RecipePage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe"),
      ),
      body: FutureBuilder(
        future: httpService.getRandomRecipe(),
        builder: (BuildContext context, AsyncSnapshot<Recipe> snapshot) {
          if (snapshot.hasData) {
            Recipe recipe = snapshot.data;
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Text("Title"),
                    subtitle: Text(recipe.originalTitle.toString()),
                  ),
                  ListTile(
                    title: Text("ID"),
                    subtitle: Text(recipe.id),
                  ),
                  ListTile(
                    title: Text("Duration Total"),
                    subtitle: Text("${recipe.durationTotal}"),
                  ),
                  ListTile(
                    title: Text("Language"),
                    subtitle: Text("${recipe.language}"),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Navigator.popAndPushNamed(context,'/title');
            Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context){
                      return new RecipePage();
                    }
                )
            );
          },
          child: Icon(Icons.add)),

    );
  }
}