import 'package:b2geta_mobile/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_theme.dart';
import '../../providers/theme_provider.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    var themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";
    debugPrint(deviceWidth.toString());

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      appBar: AppBar(
          toolbarHeight: 68,
          backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/menu.png',
                width: 23,
                height: 17,
                color: AppTheme.white15,
              ),
              onPressed: () {},
            ),
          ),
          title: SizedBox(
              width: 103.74,
              height: 14.0,
              child: themeMode
                  ? Image.asset('assets/images/b2geta_logo_light.png')
                  : Image.asset('assets/images/b2geta_logo_dark.png')),
          actions: [
            IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/search.png',
                width: 19,
                height: 19,
                color: AppTheme.white15,
              ),
              onPressed: () {
                if (themeMode) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setDarkMode();
                  showSnackbar(
                      context: context, message: 'Dark Theme Activated');
                } else {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setLightMode();
                  showSnackbar(
                      context: context, message: 'Light Theme Activated');
                }
              },
            ),
            const SizedBox(width: 4),
            IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/bell.png',
                width: 16.0,
                height: 18.0,
                color: AppTheme.white15,
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 4),
            IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/message.png',
                width: 19.0,
                height: 16.0,
                color: AppTheme.white15,
              ),
              onPressed: () {},
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
          child: Column(
            children: [
              const SizedBox(height: 1),
              Container(
                width: deviceWidth,
                height: 32,
                color: themeMode ? AppTheme.white1 : AppTheme.black5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Row(
                    children: [
                      Text(
                        "Ana Sayfa - Sepetim",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.white24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: deviceWidth,
                height: 83.0,
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                decoration: BoxDecoration(
                  color: AppTheme.blue2,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 23.0,
                      height: 21.0,
                      child: Image.asset(
                        'assets/icons/shopping_car.png',
                        color: AppTheme.white1,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Sepetim',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1,
                          ),
                        ),
                        TextSpan(
                          text: ' (3)',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.white1,
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: deviceWidth,
                    height: 47.0,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: themeMode ? AppTheme.white22 : AppTheme.black18,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Özturanlar Mobilya",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w800,
                          color: themeMode ? AppTheme.blue2 : AppTheme.white1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: deviceWidth,
                    padding: const EdgeInsets.all(9.0),
                    decoration: BoxDecoration(
                      color: themeMode ? AppTheme.white1 : AppTheme.black7,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 82.0,
                              height: 82.0,
                              decoration: BoxDecoration(
                                  color: themeMode
                                      ? AppTheme.white21
                                      : AppTheme.black20,
                                  border: Border.all(
                                    color: themeMode
                                        ? AppTheme.white21
                                        : AppTheme.black20,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Image.asset('assets/images/bag_image.png'),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Karaca Keenover 10 Parça Bıçak",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Boyut:",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.white15),
                                      ),
                                      Text(
                                        "30*29*55cm",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w400,
                                          color: themeMode
                                              ? AppTheme.green3
                                              : AppTheme.green4,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Renk:",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.white15),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Container(
                                        width: 16.0,
                                        height: 16.0,
                                        decoration: BoxDecoration(
                                            color: AppTheme.white15,
                                            border: Border.all(
                                              color: AppTheme.white15,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(2.0)),
                                        child: const ColoredBox(
                                            color: Color(0xFFFF9330)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Teslimat Süresi:",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.white15),
                                      ),
                                      Text(
                                        "Müzakere edilecek",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w400,
                                          color: themeMode
                                              ? AppTheme.blue3
                                              : AppTheme.white1,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Container(
                          width: 133,
                          height: 33,
                          margin: const EdgeInsets.only(left: 96),
                          decoration: BoxDecoration(
                            color:
                                themeMode ? AppTheme.white22 : AppTheme.black18,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 30,
                                height: 31,
                                decoration: BoxDecoration(
                                  color: themeMode
                                      ? AppTheme.white1
                                      : AppTheme.black7,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w500,
                                      color: themeMode
                                          ? AppTheme.blue2
                                          : AppTheme.white15,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "150",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: themeMode
                                        ? AppTheme.blue3
                                        : AppTheme.white1,
                                  ),
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 31,
                                margin: const EdgeInsets.only(right: 1.0),
                                decoration: BoxDecoration(
                                  color: themeMode
                                      ? AppTheme.white1
                                      : AppTheme.black7,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w500,
                                      color: themeMode
                                          ? AppTheme.blue2
                                          : AppTheme.white15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 41.0),
                              child: SizedBox(
                                width: 19.0,
                                height: 19.0,
                                child: Image.asset(
                                  "assets/icons/delete.png",
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 45,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Toplam Ücret",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white15),
                                ),
                                Text(
                                  "98,94₺",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: themeMode
                                        ? AppTheme.green3
                                        : AppTheme.green4,
                                  ),
                                ),
                                Text(
                                  "Adet başı ücret 8,5₺",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: themeMode
                                        ? AppTheme.blue2
                                        : AppTheme.white15,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
