import 'package:flutter/material.dart';
import 'package:furniture_app/components/category_title.dart';
import 'package:furniture_app/services/fetchCategories.dart';
import 'package:furniture_app/services/fetchProduct.dart';
import 'package:furniture_app/size_config.dart';
import 'category_head_list.dart';
import 'recommend_products.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: CategoryTitle(
                title: "Browse by Categories",
                defaultSize: defaultSize,
              ),
            ),
            FutureBuilder(
                future: fetchCategories(),
                builder: (context, snapshot) => snapshot.hasData
                    ? CategoriesHead(
                        categories: snapshot.data,
                      )
                    : Center(child: Image.asset("assets/ripple.gif"))),
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: CategoryTitle(
                defaultSize: defaultSize,
                title: "Recommnend For You",
              ),
            ),
            FutureBuilder(
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommendProducts(products: snapshot.data)
                    : Center(child: Image.asset("assets/ripple.gif"));
              },
              future: fetchProducts(),
            )
          ],
        ),
      ),
    );
  }
}
