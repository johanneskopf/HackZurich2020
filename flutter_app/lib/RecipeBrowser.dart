import 'package:flutter/material.dart';
import 'package:flutter_app/recipe.dart';
import 'Globals.dart';

import 'http_service.dart';
import 'models/recipe.dart';

import 'package:flutter/services.dart';

// class ListDetailWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 400,
//       child: PageView.builder(
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                 return DetailPage(index);
//               }));
//             },
//             child: Hero(
//               tag: index,
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Container(
//                   padding: EdgeInsets.all(8),
//                   child: Stack(
//                     children: <Widget>[
//                       Positioned(
//                         top: 0,
//                         bottom: 20,
//                         child: Image.asset(
//                           'images/owl.jpg',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Positioned(
//                         right: 10,
//                         bottom: 0,
//                         child: CircleAvatar(
//                           backgroundColor: Colors.red,
//                           child: Icon(
//                             Icons.arrow_forward,
//                             color: Colors.white,
//                             size: 24,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class DetailPage extends StatefulWidget {
  final recipe;

  DetailPage(this.recipe);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final double expandedHeight = 400;
  final double roundedContainerHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              buildSliverHead(),
              SliverToBoxAdapter(child: buildDetail()),
            ],
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
          )
        ],
      ),
    );
  }

  Widget buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expandedHeight,
        roundedContainerHeight,
        widget.recipe,
      ),
    );
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
            child: Text(
              'Creates insets with symmetrical vertical and horizontal offsets.' *
                  30,
              style: TextStyle(
                color: Colors.black26,
                height: 1.4,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserInfo() {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 24,
        backgroundImage:
            NetworkImage(widget.recipe.images.first.ratios.first.stack
              .replaceFirst("{stack}", "medium")),
      ),
      title: Text(widget.recipe.title),
      subtitle: Text(widget.recipe.tags.toString()),
      trailing: Icon(Icons.share),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double roundedContainerHeight;
  final recipe;

  DetailSliverDelegate(
      this.expandedHeight, this.roundedContainerHeight, this.recipe);

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
        child:
            Image.network(
              recipe.images.first.ratios.first.stack
                  .replaceFirst("{stack}", "medium"),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
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
            Positioned(
              top: expandedHeight - 120 - shrinkOffset,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Flutter',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'owl',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
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
                // return Card(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: <Widget>[
                //       ListTile(
                //         title: Text("Title"),
                //         subtitle: Text(recipe.title.toString()),
                //       ),
                //       ListTile(
                //         title: Text("ID"),
                //         subtitle: Text(recipe.id),
                //       ),
                //       ListTile(
                //         title: Text("Duration Total"),
                //         subtitle: Text("${recipe.durationTotal}"),
                //       ),
                //       ListTile(
                //         title: Text("Language"),
                //         subtitle: Text("${recipe.language}"),
                //       ),
                //       ListTile(
                //         title: Text("Rating"),
                //         subtitle: Text(
                //             "${recipe.rating.rounded == null ? "No rating" : recipe.rating.rounded}"),
                //       ),
                //       // ListTile(
                //       //   title: Text("Image"),
                //       //   subtitle: Text("${recipe.images.first.ratios.first.stack.replaceFirst("{stack}", "large")}"),
                //       // ),
                //       Image.network(recipe.images.first.ratios.first.stack
                //           .replaceFirst("{stack}", "medium")),
                //       // small / medium / large
                //       // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                //     ],
                //   ),
                // );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
