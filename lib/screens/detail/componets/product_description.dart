import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defalutSize = SizeConfig.defaultSize;
    return Container(
      constraints: BoxConstraints(minHeight: defalutSize * 44),
      padding: EdgeInsets.only(
          top: defalutSize * 9, left: defalutSize * 2, right: defalutSize * 2),
      //height: 500,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defalutSize * 1.2),
              topRight: Radius.circular(defalutSize * 1.2))),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.subTitle,
              style: TextStyle(
                fontSize: defalutSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: defalutSize * 3,
            ),
            Text(
              product.description,
              style: TextStyle(
                color: kTextColor.withOpacity(0.7),
                height: 1.5,
              ),
            ),
            SizedBox(
              height: defalutSize * 3,
            ),
            SizedBox(
              width: double.infinity,
              height: 77,
              child: Padding(
                padding: EdgeInsets.all(defalutSize * 1.5),
                child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: press,
                    child: Text(
                      "ADD TO CART",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: defalutSize * 1.6,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
