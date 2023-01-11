import 'package:b2geta_mobile/services/basket/basket_services.dart';
import 'package:b2geta_mobile/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_theme.dart';
import '../../models/basket_model.dart';
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
  late bool themeMode;
  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      appBar: _appBar(context),
      body: Column(
        children: [
          const SizedBox(height: 1),
          _pagePathName(),
          _basketCount(),
          FutureBuilder<List<BasketModel>>(
            future: BasketServices().getAllCall(),
            builder: (context, data) {
              if (data.hasData) {
                var basketList = data.data;
                if (basketList!.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: basketList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _cartItem(basketList[index]);
                      },
                    ),
                  );
                } else {
                  return const Expanded(
                      child: Center(
                          child: Text("Sepetinizde ürün bulunmamaktadır.")));
                }
              } else {
                return Expanded(
                  child: Center(
                      child: CupertinoActivityIndicator(
                    color: themeMode ? AppTheme.black1 : AppTheme.white1,
                    radius: 12,
                  )),
                );
              }
            },
          ),
          _orderSummary()
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
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
                showSnackbar(context: context, message: 'Dark Theme Activated');
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
        ]);
  }

  Widget _pagePathName() {
    return Container(
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
    );
  }

  Widget _basketCount() {
    return Container(
      width: deviceWidth,
      height: 63.0,
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
    );
  }

  Widget _cartItem(BasketModel basket) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //cart item title
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
              basket.product!.brand ?? '',
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w800,
                color: themeMode ? AppTheme.blue2 : AppTheme.white1,
              ),
            ),
          ),
        ),
        //cart item content
        Container(
          width: deviceWidth,
          padding: const EdgeInsets.symmetric(horizontal: 9.0),
          decoration: BoxDecoration(
            color: themeMode ? AppTheme.white1 : AppTheme.black7,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 9,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //cart item content image
                  Container(
                    width: 82.0,
                    height: 82.0,
                    decoration: BoxDecoration(
                        color: themeMode ? AppTheme.white21 : AppTheme.black20,
                        border: Border.all(
                          color:
                              themeMode ? AppTheme.white21 : AppTheme.black20,
                        ),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Image.asset('assets/images/bag_image.png'),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  //cart item content title
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          basket.product!.productName ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w400,
                            color: themeMode ? AppTheme.blue3 : AppTheme.white1,
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
                                  borderRadius: BorderRadius.circular(2.0)),
                              child: const ColoredBox(color: Color(0xFFFF9330)),
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
              //basket quantity change buttons
              Container(
                width: 133,
                height: 33,
                margin: const EdgeInsets.only(left: 96),
                decoration: BoxDecoration(
                  color: themeMode ? AppTheme.white22 : AppTheme.black18,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        var basketQuantity = int.parse(basket.quantity!);

                        if (basketQuantity > 1) {
                          BasketServices()
                              .updateProductInBasketCall(
                                  productId: basket.productId!,
                                  quantity:
                                      "${int.parse(basket.quantity!) - 1}")
                              .then((bool value) {
                            if (value) {
                              setState(() {});
                            }
                          });
                        }else{
                           showAlertDialog(context, () {
                            BasketServices()
                                .deleteProductInBasketCall(
                                    param1: basket.product!.id!)
                                .then((bool value) {
                              if (value) {
                                Navigator.pop(context);
                                setState(() {});
                              }
                            });
                          });
                        }
                      },
                      child:  Container(
                        width: 30,
                        height: 31,
                        margin: const EdgeInsets.only(left: 1),
                        decoration: BoxDecoration(
                          color: themeMode ? AppTheme.white1 : AppTheme.black7,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w700,
                              color:
                                  themeMode ? AppTheme.blue2 : AppTheme.white15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        basket.quantity ?? '1',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w500,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        BasketServices()
                            .updateProductInBasketCall(
                                productId: basket.productId!,
                                quantity: "${int.parse(basket.quantity!) + 1}")
                            .then((bool value) {
                          if (value) {
                            setState(() {});
                          }
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 31,
                        margin: const EdgeInsets.only(right: 1.0),
                        decoration: BoxDecoration(
                          color: themeMode ? AppTheme.white1 : AppTheme.black7,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w700,
                              color:
                                  themeMode ? AppTheme.blue2 : AppTheme.white15,
                            ),
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
              //delete button and price info
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 41.0),
                    child: GestureDetector(
                       onTap: () {
                        showAlertDialog(context, () {
                          BasketServices()
                              .deleteProductInBasketCall(
                                  param1: basket.product!.id!)
                              .then((bool value) {
                            if (value) {
                              Navigator.pop(context);
                              setState(() {});
                            }
                          });
                        });
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: 19.0,
                            height: 19.0,
                            child: Image.asset(
                              "assets/icons/delete.png",
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Sil",
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                            ),
                          ),
                        ],
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
                        basket.product!.price ?? '0' "₺",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w500,
                          color: themeMode ? AppTheme.green3 : AppTheme.green4,
                        ),
                      ),
                      Text(
                        "Adet başı ücret 8,5₺",
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w500,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 19,
              ),
              const Divider(
                height: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _orderSummary() {
    return Container(
        width: deviceWidth,
        color: themeMode ? AppTheme.white1 : AppTheme.black7,
        padding: const EdgeInsets.only(top: 21, left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sipariş Özeti",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w700,
                          color: themeMode ? AppTheme.blue2 : AppTheme.blue6),
                    ),
                    Text(
                      "Toplam Ücret",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.white15),
                    ),
                    Text(
                      '3.298,94₺',
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: AppTheme.green2,
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Center(
                      child: Text(
                        'Sepeti Onayla',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.white1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ));
  }

   void showAlertDialog(BuildContext context, VoidCallback onPressed) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("İptal"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Sil"),
      onPressed: onPressed,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Sepetten ürün çıkartma"),
      content: const Text("Silmek istediğinizden emin misiniz?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
