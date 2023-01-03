import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/providers/marketplace_provider.dart';

class ProductDetailFirstTabSubpage extends StatefulWidget {
  ProductDetailFirstTabSubpage({Key? key}) : super(key: key);

  @override
  State<ProductDetailFirstTabSubpage> createState() =>
      _ProductDetailFirstTabSubpageState();
}

class _ProductDetailFirstTabSubpageState
    extends State<ProductDetailFirstTabSubpage> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Container();
  }
}
