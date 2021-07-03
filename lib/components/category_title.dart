import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key key,
    @required this.defaultSize,
    this.title,
  }) : super(key: key);

  final double defaultSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          TextStyle(fontSize: defaultSize * 1.6, fontWeight: FontWeight.bold),
    );
  }
}
