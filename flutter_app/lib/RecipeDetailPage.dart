import 'package:flutter/material.dart';
import 'package:flutter_app/models/index.dart';
import 'package:flutter_app/recipe.dart';
import 'Globals.dart';

import 'http_service.dart';
import 'models/recipe.dart';

import 'package:flutter/services.dart';

class DetailPage extends StatefulWidget {
  final Recipe recipe;
  var currentPage = 0;

  DetailPage(this.recipe);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final double expandedHeight = 400;
  final double roundedContainerHeight = 50;
  int currentStep = 0;

  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

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
              top: MediaQuery
                  .of(context)
                  .padding
                  .top,
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 50,
                color: Theme
                    .of(context)
                    .accentColor,
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
    return Text(widget.recipe.teasertext,
        style: TextStyle(
          color: Colors.black26,
          height: 1.4,
          fontSize: 16,
        ));
  }

  Widget getIngredients() {
    print("len:");
    widget.recipe.sizes[0].ingredientBlocks.forEach((element) {
      print(element.title.toString());
    });
    print("-----------------");

    print(widget.recipe.sizes[0].ingredientBlocks[0].ingredients.length);
    widget.recipe.sizes[0].ingredientBlocks[0].ingredients.forEach((element) {
      print(element.amount.text + " " + element.text);
    });
    print("TTTTT!)");
    if (widget.recipe.sizes[0].ingredientBlocks.length > 1) {
      widget.recipe.sizes[0].ingredientBlocks[1].ingredients.forEach((element) {
        print(element.amount.text + " " + element.text);
      });
    }
    var totalSize = 0;
    widget.recipe.sizes[0].ingredientBlocks.forEach((element) {
      totalSize += 1 + element.ingredients.length;
    });

    print("totalSize $totalSize");

    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: totalSize,
      //widget.recipe.sizes[0].ingredientBlocks[0].ingredients.length,
      itemBuilder: (context, index) {
        var blockindex = 0;
        var ingredientIndex = 0;
        var isBlockTile = false;

        while (index >= 0) {
          if (index == 0) {
            isBlockTile = true;
            break;
          }
          if (index >=
              widget.recipe.sizes[0].ingredientBlocks[blockindex].ingredients
                  .length + 1) {
            index -= widget.recipe.sizes[0].ingredientBlocks[blockindex]
                .ingredients.length + 1;
            blockindex++;
          } else {
            ingredientIndex = index - 1; //as 0 element is the block title
            break;
          }
        }
        
        // print("block $blockindex ingredient: $ingredientIndex - is blocktile = $isBlockTile");

        if (isBlockTile) {
          var title = widget.recipe.sizes[0].ingredientBlocks[blockindex].title;
          return Text(
              widget.recipe.sizes[0].ingredientBlocks[blockindex].title != null
                  ? title.toString()
                  : "Basic");
        }

        RecipeSizeIngredientBlockIngredient rpib = widget.recipe.sizes[0]
            .ingredientBlocks[blockindex].ingredients[ingredientIndex];
        RecipeIngredientAmount rpiba = rpib.amount;
        return ListTile(
          title: Text(rpiba.text + " " + rpib.text),
        );
      },
    );
  }


Widget getSteps() {
  return Container(
      child: Stepper(
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
            if (currentStep >= 4)
              return; //widget.recipe.steps.length) return;
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
          steps: widget.recipe.steps
              .asMap()
              .entries
              .map<Step>((e) {
            var idx = e.key + 1;
            var myStep = e.value;
            return Step(
                title:
                Text(myStep.title == "" ? "Step ${idx}" : myStep.title),
                content: Text(myStep.description));
          }).toList()));
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
            child: widget.currentPage == 0
                ? getBasicText()
                : widget.currentPage == 1
                ? getIngredients()
                : getSteps()),
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
    subtitle: Text(
        "Calories: ${widget.recipe.nutrients.calories} cals | Duration: ${widget
            .recipe.durationTotalInMinutes} min | ${widget.recipe.sizes[0]
            .textFull}"),
    trailing: GestureDetector(
      child: Icon(
          widget.recipe.isFavorite ? Icons.favorite : Icons.favorite_border),
      onTap: () {
        if (widget.recipe.isFavorite) {
          FavoriteRecipes.remove(widget.recipe);
        } else {
          FavoriteRecipes.add(widget.recipe);
        }
        widget.recipe.isFavorite = !widget.recipe.isFavorite;

        setState(() {});
      },
    ),
  );
}}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double roundedContainerHeight;
  final recipe;
  int pageIdx;

  DetailSliverDelegate(this.expandedHeight, this.roundedContainerHeight,
      this.recipe, this.pageIdx);

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
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
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  fit: BoxFit.cover,
                )),
            Positioned(
              top: expandedHeight - roundedContainerHeight - shrinkOffset,
              left: 0,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
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
