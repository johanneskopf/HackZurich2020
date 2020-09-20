import 'package:flutter/material.dart';
import 'Globals.dart';

import 'http_service.dart';
import 'models/recipe.dart';
import 'RecipeDetailPage.dart';


class RecipeBrowserPage extends StatefulWidget {
  @override
  _RecipeBrowserWidgetState createState() => _RecipeBrowserWidgetState();
}

class _RecipeBrowserWidgetState extends State<RecipeBrowserPage> {
  final HttpService httpService = HttpService();
  Recipe recipe = null;

  _listListener() {
    setState(() {});
  }

  void NewRecipe() {
    recipe = null;
    setState(() {});
  }

  void ChangeRecipeFavorite() {
    if (recipe.isFavorite)
      FavoriteRecipes.remove(recipe);
    else
      FavoriteRecipes.add(recipe);

    recipe.isFavorite = !recipe.isFavorite;
    setState(() {});
  }

  void ForceRecipeFavorite() {
    if (!recipe.isFavorite) FavoriteRecipes.add(recipe);

    recipe.isFavorite = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipe Browser'),
        ),
        body: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DetailPage(recipe);
            }));
          },
          child: FutureBuilder(
            future: httpService.getRandomRecipe(),
            builder: (BuildContext context, AsyncSnapshot<Recipe> snapshot) {
              if (snapshot.hasData) {
                if (recipe == null) recipe = snapshot.data;
                return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.horizontal,
                    // We also need to provide a function that tells our app what to do
                    // after an item has been swiped away.
                    onDismissed: (DismissDirection dir) {
                      if (dir == DismissDirection.endToStart) {
                        ForceRecipeFavorite();
                      }
                      NewRecipe();
                    },
                    // Show a red background as the item is swiped away
                    background: Container(
                      color: Theme.of(context).primaryColor,
                      child: Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 100,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    // Background when swipping from right to left
                    secondaryBackground: Container(
                      color: Colors.green,
                      child:
                          Icon(Icons.favorite, color: Colors.white, size: 100),
                      alignment: Alignment.centerRight,
                    ),
                    child: Container(
                      height: 700,
                      width: 400,
                      child: Hero(
                        tag: "test",
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 8,
                                      child: Image.network(
                                        recipe.images.first.ratios.first.stack
                                            .replaceFirst("{stack}", "medium"),
                                        fit: BoxFit.fitHeight,
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Center(
                                          child: Text(
                                        recipe.title.toString(),
                                        style: TextStyle(fontSize: 20),
                                      ))),
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Expanded(
                                          child: FlatButton(
                                              onPressed: NewRecipe,
                                              child: Icon(Icons.refresh))),
                                      Expanded(
                                        child: FlatButton(
                                            onPressed: ChangeRecipeFavorite,
                                            child: Icon(recipe.isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_border)),
                                      ),
                                    ],
                                  ))
                                ],
                              )),
                        ),
                      ),
                    ));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
