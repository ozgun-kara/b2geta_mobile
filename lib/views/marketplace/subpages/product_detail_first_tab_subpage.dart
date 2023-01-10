import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: Text(
            "Hızlı Detaylar",
            style: TextStyle(
              fontSize: 14,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w600,
              color: Provider.of<ThemeProvider>(context).themeMode == "light"
                  ? AppTheme.blue3
                  : AppTheme.white11,
            ),
          ),
        ),
        SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 0, 25, 0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      "Özel kullanım:",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.white15,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      "Otel sandalye",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      "Tür:",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.white15,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      "Otel mobilya",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      "Uygulama:",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.white15,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      "Mutfak, Ev ofis, Oturma odası",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      "Malzeme:",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.white15,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      "Plastik",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      "Katlanmış:",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.white15,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      "Hiçbir",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      "Marka adı:",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.white15,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      "FIR",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      "Ürün adı:",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.white15,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      "Çocuklar sandalye ve masa",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      "Tarzı:",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.white15,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      "Avrupa Modern oturma Furntiure",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      "Renk:",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.white15,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      "Beyaz siyah altın mavi kırmızı",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      "Adedi:",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.white15,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      "50 adet",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 90,
                    child: Text(
                      "Çerçeve:",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.white15,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      "Plastik çerçeve",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        SizedBox(height: 34),
        Container(
            height: 1,
            color: Provider.of<ThemeProvider>(context).themeMode == "light"
                ? AppTheme.white25
                : AppTheme.black21),
        SizedBox(height: 31),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: Text(
            "Tedarik Kapasitesi",
            style: TextStyle(
              fontSize: 14,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w600,
              color: Provider.of<ThemeProvider>(context).themeMode == "light"
                  ? AppTheme.blue3
                  : AppTheme.white11,
            ),
          ),
        ),
        SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 0, 25, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tedarik Kapasitesi:",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.white15,
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  "5000 Adet / Adet per Month",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 34),
        Container(
            height: 1,
            color: Provider.of<ThemeProvider>(context).themeMode == "light"
                ? AppTheme.white25
                : AppTheme.black21),
        SizedBox(height: 31),
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: Text(
            "Ambalajlama ve Teslimat",
            style: TextStyle(
              fontSize: 14,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w600,
              color: Provider.of<ThemeProvider>(context).themeMode == "light"
                  ? AppTheme.blue3
                  : AppTheme.white11,
            ),
          ),
        ),
        SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 0, 25, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Paketleme Detayları:",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.white15,
                ),
              ),
              SizedBox(width: 9),
              Expanded(
                child: Text(
                  "1. All items would be covered with a plastic bubble wrap or soft paper,to ensure that the legs and the fabric would not be damaged.",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 34),
        Container(
            height: 1,
            color: Provider.of<ThemeProvider>(context).themeMode == "light"
                ? AppTheme.white25
                : AppTheme.black21),
        SizedBox(height: 19),
        Container(
          width: deviceWidth,
          height: 305,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://s3.gifyu.com/images/dummy-product-1.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
          child: Text(
            "Foshan Shiguang Furniture Co.,Ltd is located in Shunde District, Foshan City, which is a famous base of furniture manufacture and procurement.Our company speacializes in the development and production of wicker furniture.Items are fashionable, luxury, and high performance-to-price ratio, so it is ",
            style: TextStyle(
              fontSize: 15,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w400,
              color: Provider.of<ThemeProvider>(context).themeMode == "light"
                  ? AppTheme.blue3
                  : AppTheme.white11,
            ),
          ),
        ),
        SizedBox(height: 28),
      ],
    );
  }
}
