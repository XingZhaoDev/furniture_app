import 'package:flutter/material.dart';
import 'package:furniture_app/models/Categories.dart';

import 'category_item.dart';

class CategoriesHead extends StatelessWidget {
  const CategoriesHead({
    Key key,
    this.categories,
  }) : super(key: key);

  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            categories.length,
            (index) => CategoryItem(
                  category: categories[index],
                )),
      ),
    );
  }
}
