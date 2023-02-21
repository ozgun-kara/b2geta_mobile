import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyInfoSubPage extends StatefulWidget {
  const CompanyInfoSubPage({Key? key}) : super(key: key);

  @override
  State<CompanyInfoSubPage> createState() => _CompanyInfoSubPageState();
}

class _CompanyInfoSubPageState extends State<CompanyInfoSubPage> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(21, 19, 21, 36),
            child: Text(
              "Fostan Shougang Furniture Co.,Ltd is located in Shunned District, Fostan City, which is a famous base of furniture manufacture and procurement.Our company specializes in the development and production of wicker furniture.Items are fashionable, luxury, and high performance-to-price ratio, so it is popular in more than 30 countries and regions such as Europe, the United States, Africa, Southeast Asia and Russia.The company not only has a better management system, but also has a energetic, efficient and innovative R&D team. Base on 16 years of furniture production experience, the company has formed a standardized production process. It is in accordance with international stringent standards, including the selection of materials, cutting, grinding baking, testing and packaging. Each process has undergone rigorous testing, thus the products have been certified by SGS. Fostan Shougang Furniture Co.,Ltd is located in Shunned District, Fostan City, which is a famous base of furniture manufacture and procurement.Our company specializes in the development and production of wicker furniture.Items are fashionable, luxury, and high performance-to-price ratio, so it is popular in more than 30 countries and regions such as Europe, the United States, Africa, Southeast Asia and Russia.The company not only has a better management system, but also has a energetic, efficient and innovative R&D team. Base on 16 years of furniture production experience, the company has formed a standardized production process. It is in accordance with international stringent standards, including the selection of materials, cutting, grinding baking, testing and packaging. Each process has undergone rigorous testing, thus the products have been certified by SGS.",
              style: TextStyle(
                fontSize: 15,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w400,
                color: themeMode ? AppTheme.blue3 : AppTheme.white15,
              ),
            ),
          );
        },
      ),
    );
  }
}
