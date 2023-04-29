import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class MarketplacePage2 extends StatefulWidget {
  const MarketplacePage2({Key? key}) : super(key: key);

  @override
  State<MarketplacePage2> createState() => _MarketplacePage2State();
}

class _MarketplacePage2State extends State<MarketplacePage2> {
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

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 11,
            left: 13,
          ),
          child: Column(
            children: [
              _bannerItem(
                  imageUrl:
                      "assets/images/dummy_images/marketplace/marketplace_image1.png",
                  height: 205,
                  width: deviceWidth),
              //SPACE
              const SizedBox(
                height: 14.0,
              ),
              //CATEGORY LIST
              SizedBox(
                height: 130,
                width: deviceWidth,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _categoryItem(
                        imageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image2.png",
                        text: 'İnşaat Malzemeleri'),
                    _categoryItem(
                        imageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image3.png",
                        text: 'Mobilya ve Dekorasyon'),
                    _categoryItem(
                        imageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image4.png",
                        text: 'Otomotiv Yedek Parça'),
                    _categoryItem(
                        imageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image5.png",
                        text: 'Ham Madde'),
                  ],
                ),
              ),
              //SPACE
              const SizedBox(
                height: 28.0,
              ),
              //PRODUCT LIST
              SizedBox(
                height: 15,
                width: deviceWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'En çok talep gören ürünler',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w700,
                        color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Row(
                        children: [
                          Text(
                            'Tümü',
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.3,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color:
                                  themeMode ? AppTheme.blue2 : AppTheme.white11,
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Image.asset(
                            "assets/icons/next.png",
                            width: 10,
                            height: 8,
                            color:
                                themeMode ? AppTheme.blue2 : AppTheme.white11,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 23.0,
              ),
              SizedBox(
                height: 222,
                width: deviceWidth,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _productItem(
                        productImageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image6.png",
                        productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                        productPrice: '128 - 290'),
                    const SizedBox(
                      width: 15,
                    ),
                    _productItem(
                        productImageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image7.png",
                        productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                        productPrice: '128 - 290'),
                    const SizedBox(
                      width: 15,
                    ),
                    _productItem(
                        productImageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image8.png",
                        productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                        productPrice: '128 - 290'),
                  ],
                ),
              ),
              //SPACE
              const SizedBox(
                height: 23,
              ),
              _bannerItem(
                  imageUrl:
                      "assets/images/dummy_images/marketplace/marketplace_image9.png",
                  width: deviceWidth,
                  height: 150),
              //SPACE
              const SizedBox(
                height: 28.0,
              ),
              //PRODUCT LIST
              SizedBox(
                height: 15,
                width: deviceWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Mobilya ve Dekorasyon',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w700,
                        color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Row(
                        children: [
                          Text(
                            'Tümü',
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.3,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color:
                                  themeMode ? AppTheme.blue2 : AppTheme.white11,
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Image.asset(
                            "assets/icons/next.png",
                            width: 10,
                            height: 8,
                            color:
                                themeMode ? AppTheme.blue2 : AppTheme.white11,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 23.0,
              ),
              SizedBox(
                height: 222,
                width: deviceWidth,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _productItem(
                        productImageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image10.png",
                        productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                        productPrice: '128 - 290'),
                    const SizedBox(
                      width: 15,
                    ),
                    _productItem(
                        productImageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image11.png",
                        productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                        productPrice: '128 - 290'),
                    const SizedBox(
                      width: 15,
                    ),
                    _productItem(
                        productImageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image12.png",
                        productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                        productPrice: '128 - 290'),
                  ],
                ),
              ),
              //SPACE
              const SizedBox(
                height: 23,
              ),
              _bannerItem(
                  imageUrl:
                      "assets/images/dummy_images/marketplace/marketplace_image13.png",
                  width: deviceWidth,
                  height: 150),
              //SPACE
              const SizedBox(
                height: 28.0,
              ),
              //PRODUCT LIST
              SizedBox(
                height: 15,
                width: deviceWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'İstanbul\'dan Popüler Ürünler',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w700,
                        color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Row(
                        children: [
                          Text(
                            'Tümü',
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.3,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color:
                                  themeMode ? AppTheme.blue2 : AppTheme.white11,
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Image.asset(
                            "assets/icons/next.png",
                            width: 10,
                            height: 8,
                            color:
                                themeMode ? AppTheme.blue2 : AppTheme.white11,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 23.0,
              ),
              SizedBox(
                height: 222,
                width: deviceWidth,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _productItem(
                        productImageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image14.png",
                        productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                        productPrice: '128 - 290'),
                    const SizedBox(
                      width: 15,
                    ),
                    _productItem(
                        productImageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image15.png",
                        productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                        productPrice: '128 - 290'),
                    const SizedBox(
                      width: 15,
                    ),
                    _productItem(
                        productImageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image16.png",
                        productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                        productPrice: '128 - 290'),
                  ],
                ),
              ),
              //SPACE
              const SizedBox(
                height: 23,
              ),
              _bannerItem(
                  imageUrl:
                      "assets/images/dummy_images/marketplace/marketplace_image17.png",
                  width: deviceWidth,
                  height: 150),
              //SPACE
              const SizedBox(
                height: 23.0,
              ),
              //PRODUCT LIST
              SizedBox(
                height: 15,
                width: deviceWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Otomotiv Yedek Parça',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w700,
                        color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Row(
                        children: [
                          Text(
                            'Tümü',
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.3,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color:
                                  themeMode ? AppTheme.blue2 : AppTheme.white11,
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Image.asset(
                            "assets/icons/next.png",
                            width: 10,
                            height: 8,
                            color:
                                themeMode ? AppTheme.blue2 : AppTheme.white11,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 23.0,
              ),
              SizedBox(
                height: 222,
                width: deviceWidth,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _productItem(
                        productImageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image18.png",
                        productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                        productPrice: '128 - 290'),
                    const SizedBox(
                      width: 15,
                    ),
                    _productItem(
                        productImageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image19.png",
                        productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                        productPrice: '128 - 290'),
                    const SizedBox(
                      width: 15,
                    ),
                    _productItem(
                        productImageUrl:
                            "assets/images/dummy_images/marketplace/marketplace_image20.png",
                        productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                        productPrice: '128 - 290'),
                  ],
                ),
              ),
              //SPACE
              const SizedBox(
                height: 23,
              ),
              _bannerItem(
                  imageUrl:
                      "assets/images/dummy_images/marketplace/marketplace_image21.png",
                  width: deviceWidth,
                  height: 150),
              //SPACE
              const SizedBox(
                height: 23.0,
              ),
              //PRODUCT LIST
              SizedBox(
                height: 15,
                width: deviceWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Yeni Eklenen Ürünler',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w700,
                        color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Row(
                        children: [
                          Text(
                            'Tümü',
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.3,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color:
                                  themeMode ? AppTheme.blue2 : AppTheme.white11,
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Image.asset(
                            "assets/icons/next.png",
                            width: 10,
                            height: 8,
                            color:
                                themeMode ? AppTheme.blue2 : AppTheme.white11,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 23.0,
              ),
              GridView(
                padding: const EdgeInsets.only(right: 12),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 9.0,
                  mainAxisSpacing: 21.0,
                  mainAxisExtent: 300,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  _productItem(
                    productImageUrl:
                        "assets/images/dummy_images/marketplace/marketplace_image22.png",
                    productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                    productPrice: '128 - 290',
                    width: 178,
                    height: 206,
                  ),
                  _productItem(
                    productImageUrl:
                        "assets/images/dummy_images/marketplace/marketplace_image23.png",
                    productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                    productPrice: '128 - 290',
                    width: 178,
                    height: 206,
                  ),
                  _productItem(
                    productImageUrl:
                        "assets/images/dummy_images/marketplace/marketplace_image24.png",
                    productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                    productPrice: '128 - 290',
                    width: 178,
                    height: 206,
                  ),
                  _productItem(
                    productImageUrl:
                        "assets/images/dummy_images/marketplace/marketplace_image25.png",
                    productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                    productPrice: '128 - 290',
                    width: 178,
                    height: 206,
                  ),
                  _productItem(
                    productImageUrl:
                        "assets/images/dummy_images/marketplace/marketplace_image26.png",
                    productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                    productPrice: '128 - 290',
                    width: 178,
                    height: 206,
                  ),
                  _productItem(
                    productImageUrl:
                        "assets/images/dummy_images/marketplace/marketplace_image27.png",
                    productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                    productPrice: '128 - 290',
                    width: 178,
                    height: 206,
                  ),
                  _productItem(
                    productImageUrl:
                        "assets/images/dummy_images/marketplace/marketplace_image28.png",
                    productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                    productPrice: '128 - 290',
                    width: 178,
                    height: 206,
                  ),
                  _productItem(
                    productImageUrl:
                        "assets/images/dummy_images/marketplace/marketplace_image29.png",
                    productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                    productPrice: '128 - 290',
                    width: 178,
                    height: 206,
                  ),
                  _productItem(
                    productImageUrl:
                        "assets/images/dummy_images/marketplace/marketplace_image30.png",
                    productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                    productPrice: '128 - 290',
                    width: 178,
                    height: 206,
                  ),
                  _productItem(
                    productImageUrl:
                        "assets/images/dummy_images/marketplace/marketplace_image31.png",
                    productName: 'Karaca Keenover 10 Parça Bıçak Seti Xl',
                    productPrice: '128 - 290',
                    width: 178,
                    height: 206,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productItem({
    required String productImageUrl,
    required String productName,
    required String productPrice,
    double? width,
    double? height,
  }) {
    return Column(
      children: [
        Container(
          width: width ?? 134,
          height: height ?? 155,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: AppTheme.white21),
              color: AppTheme.white1,
              image: DecorationImage(
                image: AssetImage(productImageUrl),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          height: 14.0,
        ),
        SizedBox(
          width: 127,
          height: 30,
          child: Text(
            productName,
            style: TextStyle(
              fontSize: 12,
              height: 1.2,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w500,
              color: themeMode ? AppTheme.blue3 : AppTheme.white1,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 127,
          height: 15,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "$productPrice ",
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w500,
                height: 1.2,
                color: themeMode ? AppTheme.blue2 : AppTheme.white1,
              ),
            ),
            TextSpan(
              text: "₺",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: themeMode ? AppTheme.blue2 : AppTheme.white1,
              ),
            )
          ])),
        ),
      ],
    );
  }

  Widget _categoryItem({required String imageUrl, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 90,
            height: 30,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                height: 1.2,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w500,
                color: themeMode ? AppTheme.blue3 : AppTheme.white1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bannerItem(
      {required String imageUrl,
      required double width,
      required double height}) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
