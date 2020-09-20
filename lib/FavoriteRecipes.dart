import 'package:flutter/material.dart';
import 'package:flutter_app/Globals.dart';
import 'package:flutter_app/RecipeBrowser.dart';

import 'RecipeDetailPage.dart';
import 'models/recipe.dart';

class FavoriteRecipesPage extends StatefulWidget {
  @override
  _FavoriteRecipesWidgetState createState() => _FavoriteRecipesWidgetState();
}

class _FavoriteRecipesWidgetState extends State<FavoriteRecipesPage> {
  _listListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Container(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: FavoriteRecipes.length,
            itemBuilder: (BuildContext context, int index) {
              return RecipeButton(
                info: FavoriteRecipes[index],
                parent: this,
              );
            },
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RecipeBrowserPage()),
            );
            setState(() {});
          },
          child: Icon(Icons.add, color: Colors.white,)),
    );
  }
}

class RecipeButton extends StatelessWidget {
  final Recipe info;
  _FavoriteRecipesWidgetState parent;

  RecipeButton({this.info, this.parent});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: RaisedButton(
            onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DetailPage(info);
              }));
              parent.setState(() {});
            },
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(10),
            child: Row(children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.green,
                      child: Image.network(
                          info.images.first.ratios.first.stack
                              .replaceFirst("{stack}", "medium"),
                          fit: BoxFit.cover))),
              Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(info.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        )),
                  )),
              Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () async {
                      showAlertDialog(context, info, parent);
                    },
                    child: Icon(Icons.delete,
                        color: Theme.of(context).primaryColor),
                  ))
            ])));
  }

  void showAlertDialog(
      BuildContext context, Recipe recipe, _FavoriteRecipesWidgetState parent) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext) {
          return AlertDialog(
              title: Text("Remove from Favorites?"),
              content: Text("Do you really want to remove ${recipe.title}?"),
              actions: <Widget>[
                RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      FavoriteRecipes.remove(recipe);
                      Navigator.of(context).pop();
                    },
                    child: Text('Remove')),
                RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'))
              ]);
        }).then((value) {
      print(value);
      print(parent);
      parent.setState(() {});
      print("set State");
    });
  }
}
