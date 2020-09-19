import 'package:flutter/material.dart';
import 'package:flutter_app/recipe.dart';
import 'Globals.dart';

import 'http_service.dart';
import 'models/recipe.dart';

import 'package:flutter/services.dart';

class DetailPage extends StatefulWidget {
  final recipe;
  var currentPage = 0;

  DetailPage(this.recipe);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final double expandedHeight = 400;
  final double roundedContainerHeight = 50;
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 50),
            child: CustomScrollView(
              slivers: <Widget>[
                buildSliverHead(),
                SliverToBoxAdapter(child: buildDetail()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                color: Theme.of(context).accentColor,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: FlatButton(
                      child: Text("Info"),
                      onPressed: () {
                        widget.currentPage = 0;
                        setState(() {});
                      },
                    )),
                    Expanded(
                        child: FlatButton(
                      child: Text("Incredients"),
                      onPressed: () {
                        widget.currentPage = 1;
                        setState(() {});
                      },
                    )),
                    Expanded(
                        child: FlatButton(
                      child: Text("Steps"),
                      onPressed: () {
                        widget.currentPage = 2;
                        setState(() {});
                      },
                    ))
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(expandedHeight, roundedContainerHeight,
          widget.recipe, widget.currentPage),
    );
  }

  Widget getBasicText() {
    return Text(widget.recipe.teasertext * 20,
        style: TextStyle(
          color: Colors.black26,
          height: 1.4,
          fontSize: 16,
        ));
  }

  Widget getSteps() {
    return
      Container(child:
      Stepper(
          physics: ClampingScrollPhysics(),
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
            Container(),
        onStepTapped: (index) {
          setState(() {
              currentStep = index;
          });
        },
          currentStep: currentStep,
          onStepContinue: () {
            if (currentStep >= 4) return; //widget.recipe.steps.length) return;
            setState(() {
              currentStep += 1;
            });
          },
          onStepCancel: () {
            if (currentStep <= 0) return;
            setState(() {
              currentStep -= 1;
            });
          },
          steps:
          <Step>[
            Step(
              title: Text('Step 1'),
              content: Text('aaaa' * 100)
            ),
            Step(
              title: Text('Step 2'),
                content: Text('aaaa' * 100)
            ),
            Step(
              title: Text('Step 3'),
              content: Text("asdf" * 10),
            ),
            Step(
              title: Text('Step 4'),
                content: Text('aaaa' * 100)
            ),
            Step(
              title: Text('Step 5'),
                content: Text('aaaa' * 100)
            ),
          ],
        )
      )
      ;
  }

  Widget buildDetail() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildUserInfo(),
          Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              child: widget.currentPage == 0 ? getBasicText() : getSteps()),
        ],
      ),
    );
  }

  Widget buildUserInfo() {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 24,
        backgroundImage: NetworkImage(widget.recipe.images.first.ratios[0].stack
            .replaceFirst("{stack}", "medium")),
      ),
      title: Text(widget.recipe.title),
      subtitle: Text("widget.recipe.tags"),
      trailing: Icon(Icons.share),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double roundedContainerHeight;
  final recipe;
  int pageIdx;

  DetailSliverDelegate(this.expandedHeight, this.roundedContainerHeight,
      this.recipe, this.pageIdx);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Hero(
        tag: recipe,
        child: Stack(
          children: <Widget>[
            Container(
                color: Colors.blue,
                height: expandedHeight,
                child: Image.network(
                  recipe.images.first.ratios[4].stack
                      .replaceFirst("{stack}", "large"),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                )),
            Positioned(
              top: expandedHeight - roundedContainerHeight - shrinkOffset,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: roundedContainerHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),

            // Positioned(
            //   top: expandedHeight - 120 - shrinkOffset,
            //   left: 30,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //     //   Text(
            //     //     "Recipe",
            //     //     style: TextStyle(
            //     //       color: Theme.of(context).primaryColor,
            //     //       fontSize: 30,
            //     //     ),
            //     //   ),
            //     //   Text(
            //     //     'owl',
            //     //     style: TextStyle(
            //     //       color: Colors.white,
            //     //       fontSize: 15,
            //     //     ),
            //     //   ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

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
