import 'package:flutter/material.dart';
import 'package:furniture_app/components/category_title.dart';
import 'package:furniture_app/models/Categories.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'custom_shape.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key key,
    @required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: SizedBox(
        width: defaultSize * 20.5,
        child: AspectRatio(
          aspectRatio: 0.83,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              ClipPath(
                clipper: CategoryCustomShape(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    color: kSecondaryColor,
                    padding: EdgeInsets.all(defaultSize * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // ignore: missing_required_param
                        CategoryTitle(
                          title: category.title,
                          defaultSize: 10,
                        ),
                        SizedBox(height: defaultSize),
                        Text(
                          "${category.numOfProducts}+ Products",
                          style: TextStyle(color: kTextColor.withOpacity(0.6)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 1.15,
                  child: FadeInImage.assetNetwork(
                      placeholder: "assets/spinner.gif", image: category.image),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
