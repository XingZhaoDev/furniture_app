import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/screens/detail/componets/product_description.dart';
import 'package:furniture_app/screens/detail/componets/product_info.dart';
import 'package:furniture_app/size_config.dart';

class DetailBody extends StatelessWidget {
  final Product product;

  const DetailBody({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defalutSize = SizeConfig.defaultSize;
    TextStyle lightStyle = TextStyle(color: kTextColor.withOpacity(0.6));

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductInfo(product: product),
            Positioned(
              top: defalutSize * 37.5,
              left: 0,
              right: 0,
              child: ProductDescription(
                  product: product,
                  press: () {
                    print('add to chart');
                  }),
            ),
            Positioned(
              top: defalutSize * 9.5,
              right: -defalutSize * 7.5,
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  height: defalutSize * 37.8,
                  width: defalutSize * 36.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
