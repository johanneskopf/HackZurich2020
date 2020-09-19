import 'package:flutter/material.dart';
import 'package:flutter_app/models/index.dart';
import 'package:flutter_html/flutter_html.dart';
import 'Globals.dart';

import 'package:flutter/services.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage(this.product);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final double expandedHeight = 500;
  final double roundedContainerHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(expandedHeight, roundedContainerHeight,
          widget.product),
    );
  }

  Widget getBasicText() {
    return Html(data: widget.product.description.text);
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
              child: getBasicText()
          ),
        ],
      ),
    );
  }

  Widget buildUserInfo() {
    return ListTile(
      leading: CircleAvatar(
        // backgroundColor: Colors.blue,
        radius: 24,
        backgroundImage: NetworkImage(widget.product.image.original),
      ),
      title: Text(widget.product.name),
      subtitle: Text(
          "Price: ${widget.product.price.currency} ${widget.product.price.base.price} per ${widget.product.price.base.quantity} ${widget.product.price.base.unit}"),
      // trailing: GestureDetector(
      //   child: Icon(
      //       widget.recipe.isFavorite ? Icons.favorite : Icons.favorite_border),
      //   onTap: () {
      //     if (widget.recipe.isFavorite) {
      //       FavoriteRecipes.remove(widget.recipe);
      //     } else {
      //       FavoriteRecipes.add(widget.recipe);
      //     }
      //     widget.recipe.isFavorite = !widget.recipe.isFavorite;
      //
      //     setState(() {});
      //   },
      // ),
    );
  }}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double roundedContainerHeight;
  final Product product;

  DetailSliverDelegate(this.expandedHeight, this.roundedContainerHeight,
      this.product);

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
        tag: product,
        child: Stack(
          children: <Widget>[
            Container(
                height: expandedHeight,
                child: Image.network(
                  product.image.original,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width ,
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
