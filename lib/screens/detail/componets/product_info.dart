import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/size_config.dart';

import '../../../constants.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double defalutSize = SizeConfig.defaultSize;
    TextStyle lightStyle = TextStyle(color: kTextColor.withOpacity(0.6));

    return Container(
      padding: EdgeInsets.symmetric(horizontal: defalutSize * 2),
      height: defalutSize * 37.5,
      width: defalutSize *
          (SizeConfig.orientation == Orientation.landscape ? 35 : 15),
      //color: Colors.black45,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              product.category.toUpperCase(),
              style: lightStyle,
            ),
            SizedBox(height: defalutSize),
            Text(
              product.title,
              style: TextStyle(
                  fontSize: defalutSize * 2.4,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.8,
                  height: 1.4),
            ),
            SizedBox(
              height: defalutSize * 2,
            ),
            Text("From", style: lightStyle),
            Text(
              "\$${product.price}",
              style: TextStyle(
                fontSize: defalutSize * 1.6,
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
            SizedBox(height: defalutSize * 2),
            Text("Available Colors",
                overflow: TextOverflow.visible, style: lightStyle),
            Row(
              children: [
                buildColorBox(defalutSize,
                    color: Color(0xFF7BA275), isActive: true),
                buildColorBox(defalutSize, color: Color(0xFFD7D7D7)),
                buildColorBox(defalutSize, color: kTextColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildColorBox(double defalutSize,
      {Color color, bool isActive = false}) {
    return Container(
      margin: EdgeInsets.only(top: defalutSize, right: defalutSize),
      padding: const EdgeInsets.all(5.0), // const for fixed value
      height: defalutSize * 2.4,
      width: defalutSize * 2.4,
      decoration: BoxDecoration(
        color: color /*Color(0xFF7BA275)*/,
        borderRadius: BorderRadius.circular(6),
      ),
      child: isActive ? SvgPicture.asset("assets/icons/check.svg") : SizedBox(),
    );
  }
}
