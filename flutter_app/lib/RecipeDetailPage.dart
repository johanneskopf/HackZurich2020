import 'package:flutter/material.dart';
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
    return Text(widget.recipe.teasertext,
        style: TextStyle(
          color: Colors.black26,
          height: 1.4,
          fontSize: 16,
        ));
  }

  Widget getIngredients() {
    print(widget.recipe.ingredients[0].modified.toString());
    print(widget.recipe.ingredients[0].familyIds.toString());

    return ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.recipe.ingredients.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text( //widget.recipe.sizes[0].ingredientBlocks[index].ingredients[]
                  widget.recipe.ingredients[index].name.singular), // sizes[0] => for 2 Persons; sizes[1] => for 4 Persons; ... sizes[4] => 10 Persons
            ),
            Divider(), //                           <-- Divider
          ],
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
            steps: widget.recipe.steps.asMap().entries.map<Step>((e) {
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
      subtitle: Text("Calories: ${widget.recipe.nutrients.calories}"),
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
