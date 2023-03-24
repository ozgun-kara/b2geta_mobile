import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/products/product_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:b2geta_mobile/views/custom_widgets/custom_appbar.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/add_product_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyProductsSubPage extends StatefulWidget {
  const MyProductsSubPage({Key? key}) : super(key: key);

  @override
  State<MyProductsSubPage> createState() => _MyProductsSubPageState();
}

class _MyProductsSubPageState extends State<MyProductsSubPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;
  ScrollController controller = ScrollController();
  final ProductsServices _productsServices = ProductsServices();
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    await _productsServices.productsListAndSearchCallTest(queryParameters: {
      "offset": '0',
      "limit": '15',
    }).then((value) {
      setState(() {
        products = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black24,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Container(
              width: deviceWidth,
              height: 1,
              color: themeMode ? AppTheme.white21 : AppTheme.black28,
            ),
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'My Products-1'.tr,
                    style: TextStyle(
                      fontFamily: AppTheme.appFontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                    ),
                  ),
                  const SizedBox(height: 21),
                  MaterialButton(
                      minWidth: deviceWidth,
                      height: 52,
                      elevation: 0,
                      color: AppTheme.blue2,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Text(
                        'Add Product'.tr,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AddProductSubPage(operation: 'Add'),
                            ));
                      }),
                ],
              ),
            ),
            const SizedBox(height: 17),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: deviceWidth,
                  height: 2,
                  color: themeMode ? AppTheme.white21 : AppTheme.black28,
                ),
              ],
            ),
            products.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      var product = products[index];
                      return Container(
                        color: themeMode ? AppTheme.white1 : AppTheme.black24,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 21, right: 17.88, top: 18, bottom: 24),
                          child: SizedBox(
                            width: deviceWidth,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Product Name'.tr,
                                          style: TextStyle(
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15),
                                        ),
                                        SizedBox(
                                          width: deviceWidth - 140,
                                          child: Text(
                                            product.name!.tr ?? 'Product Name',
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: themeMode
                                                  ? AppTheme.blue2
                                                  : AppTheme.white1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        MaterialButton(
                                            minWidth: 0,
                                            height: 18,
                                            elevation: 3,
                                            color: AppTheme.white1,
                                            shape: const CircleBorder(),
                                            padding: EdgeInsets.zero,
                                            child: Center(
                                              child: Image.asset(
                                                'assets/icons/delete.png',
                                                width: 18,
                                                height: 18,
                                              ),
                                            ),
                                            onPressed: () {}),
                                        MaterialButton(
                                            minWidth: 0,
                                            height: 18,
                                            elevation: 0,
                                            color: AppTheme.white1,
                                            shape: const CircleBorder(),
                                            padding: EdgeInsets.zero,
                                            child: Center(
                                              child: Image.asset(
                                                'assets/icons/edit.png',
                                                width: 18.13,
                                                height: 15,
                                              ),
                                            ),
                                            onPressed: () {}),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Price'.tr,
                                          style: TextStyle(
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15),
                                        ),
                                        Text(
                                          product.price ?? '',
                                          style: TextStyle(
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: themeMode
                                                  ? AppTheme.blue3
                                                  : AppTheme.white1),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 79,
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Currency'.tr,
                                            style: TextStyle(
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppTheme.white15),
                                          ),
                                          Text(
                                            product.currency ?? '',
                                            style: TextStyle(
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: themeMode
                                                    ? AppTheme.blue3
                                                    : AppTheme.white1),
                                          ),
                                        ]),
                                    const SizedBox(
                                      width: 45,
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Brand'.tr,
                                            style: TextStyle(
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppTheme.white15),
                                          ),
                                          Text(
                                            'Rosebella',
                                            style: TextStyle(
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: themeMode
                                                    ? AppTheme.blue3
                                                    : AppTheme.white1),
                                          ),
                                        ])
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        width: deviceWidth,
                        height: 2,
                        color: themeMode ? AppTheme.white21 : AppTheme.black28,
                      );
                    },
                  )
                : const SizedBox(),
            const SizedBox(
              height: 27,
            ),
            Text(
              '1–10 of 24',
              style: TextStyle(
                fontFamily: AppTheme.appFontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: themeMode ? AppTheme.blue3 : AppTheme.white1,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                    minWidth: 0,
                    height: 39,
                    color: AppTheme.white42,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19, vertical: 13),
                    child: Image.asset(
                      'assets/icons/back-3.png',
                      color: themeMode ? AppTheme.white1 : AppTheme.black29,
                      height: 13,
                      width: 27,
                    ),
                    onPressed: () {}),
                const SizedBox(
                  width: 10,
                ),
                MaterialButton(
                    minWidth: 0,
                    height: 39,
                    color: themeMode ? AppTheme.blue3 : AppTheme.blue2,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19, vertical: 13),
                    child: Image.asset(
                      'assets/icons/arrow_next.png',
                      color: AppTheme.white1,
                      height: 13,
                      width: 27,
                    ),
                    onPressed: () {}),
              ],
            ),
            const SizedBox(
              height: 37,
            ),
          ],
        ),
      ),
    );
  }
}
