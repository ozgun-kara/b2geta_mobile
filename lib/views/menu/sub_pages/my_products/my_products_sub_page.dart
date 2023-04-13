import 'dart:ui';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/products/product_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_app_bar.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/add_product_sub_page.dart';
import 'package:flutter/cupertino.dart';
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
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const AddProductSubPage(operation: 'Add'),
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 0),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
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
            FutureBuilder<List<ProductModel>>(
              future: locator<ProductsServices>()
                  .productsListAndSearchCall(queryParameters: {"limit": "50"}),
              builder: (context, data) {
                if (data.hasData) {
                  var productList = data.data;

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productList!.length,
                    separatorBuilder: (context, index) {
                      return Container(
                        width: deviceWidth,
                        height: 2,
                        color: themeMode ? AppTheme.white21 : AppTheme.black28,
                      );
                    },
                    itemBuilder: ((context, index) {
                      var product = productList[index];

                      return Container(
                        color: themeMode ? AppTheme.white1 : AppTheme.black24,
                        padding: const EdgeInsets.only(
                            left: 21, right: 17.88, top: 18, bottom: 24),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Product Name'.tr,
                                      style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
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
                                          fontFamily: AppTheme.appFontFamily,
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
                                    Material(
                                      color: Colors.transparent,
                                      child: IconButton(
                                          splashRadius: 24,
                                          icon: Center(
                                            child: Image.asset(
                                              'assets/icons/delete.png',
                                              width: 18,
                                              height: 18,
                                            ),
                                          ),
                                          onPressed: () async {
                                            debugPrint(
                                                "PRODUCT ID: ${product.id}");

                                            return await alertDialog(
                                                message:
                                                    'Silmek istediğinizden emin misiniz?',
                                                confirmButtonColor:
                                                    Colors.green,
                                                confirmButtonText: 'Evet',
                                                cancelButtonColor: Colors.red,
                                                cancelButtonText: 'Hayır',
                                                onPressed: () async {
                                                  await locator<
                                                          ProductsServices>()
                                                      .deleteProductCall(
                                                          productId:
                                                              product.id!)
                                                      .then((value) {
                                                    if (value) {
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    }
                                                  });
                                                });
                                          }),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: IconButton(
                                        splashRadius: 24,
                                        icon: Center(
                                          child: Image.asset(
                                            'assets/icons/material-symbols_edit-note.png',
                                            width: 24,
                                            height: 24,
                                          ),
                                        ),
                                        onPressed: () async {
                                          await locator<ProductsServices>()
                                              .getProductCall(
                                                  productId: product.id!,
                                                  queryParameters: {}).then((value) {
                                            if (value != null) {
                                              Navigator.push(
                                                      context,
                                                      PageRouteBuilder(
                                                        pageBuilder:
                                                            (_, __,
                                                                    ___) =>
                                                                AddProductSubPage(
                                                                    passedObject:
                                                                        value,
                                                                    operation:
                                                                        'Edit'),
                                                        transitionDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    0),
                                                        reverseTransitionDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    0),
                                                        transitionsBuilder:
                                                            (_, a, __, c) =>
                                                                FadeTransition(
                                                                    opacity: a,
                                                                    child: c),
                                                      ))
                                                  .then((_) => setState(() {}));
                                            } else {
                                              debugPrint(
                                                  "PRODUCT DETAIL HAS NOT FETCHED");

                                              operationFailedDialog(context);
                                            }
                                          });
                                        },
                                      ),
                                    ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Price'.tr,
                                      style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.white15),
                                    ),
                                    Text(
                                      product.price ?? '',
                                      style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
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
                                            fontFamily: AppTheme.appFontFamily,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.white15),
                                      ),
                                      Text(
                                        product.currency ?? '',
                                        style: TextStyle(
                                            fontFamily: AppTheme.appFontFamily,
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
                                            fontFamily: AppTheme.appFontFamily,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.white15),
                                      ),
                                      Text(
                                        'Rosebella',
                                        style: TextStyle(
                                            fontFamily: AppTheme.appFontFamily,
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
                      );
                    }),
                  );
                } else {
                  return SizedBox(
                    height: deviceWidth + 115,
                    child: Center(
                        child: CupertinoActivityIndicator(
                      color: themeMode ? AppTheme.black1 : AppTheme.white1,
                      radius: 12,
                    )),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Column(
          children: [
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

  alertDialog(
      {required String message,
      required String confirmButtonText,
      required confirmButtonColor,
      required String cancelButtonText,
      required cancelButtonColor,
      required VoidCallback onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(4),
            backgroundColor: Colors.transparent,
            content: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.white1
                          : AppTheme.black12,
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.warning_rounded,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Alert'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.black25
                                    : AppTheme.white1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 40),
                      Expanded(
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.black25
                                    : AppTheme.white1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTheme(
                        height: 32,
                        child: MaterialButton(
                            elevation: 0,
                            color: cancelButtonColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Text(
                              cancelButtonText,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.white1),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ButtonTheme(
                        height: 32,
                        child: MaterialButton(
                            elevation: 0,
                            color: confirmButtonColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            onPressed: () {
                              onPressed();
                            },
                            child: Text(
                              confirmButtonText,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.white1),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void operationFailedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              insetPadding: const EdgeInsets.all(4),
              backgroundColor: Colors.transparent,
              content: Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                    color: themeMode ? AppTheme.white1 : AppTheme.black12,
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 40),
                        Expanded(
                          child: Text(
                            'Operation Failed Dialog'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color: themeMode
                                  ? AppTheme.black25
                                  : AppTheme.white1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.error_outline_sharp,
                          size: 24,
                          color: themeMode ? AppTheme.black16 : AppTheme.white1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ButtonTheme(
                      height: 32,
                      child: MaterialButton(
                          elevation: 0,
                          color:
                              themeMode ? AppTheme.black16 : AppTheme.black18,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            'Close'.tr,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white1),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
