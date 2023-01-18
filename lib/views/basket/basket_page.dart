import 'package:b2geta_mobile/services/basket/basket_services.dart';
import 'package:b2geta_mobile/views/marketplace/subpages/shopping_summary_subpage.dart';
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
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      body: SingleChildScrollView(
        child: Column(
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
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: basketList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _cartItem(basketList[index]);
                      },
                    );
                  } else {
                    return SizedBox(
                      width: deviceWidth,
                      height: deviceHeight,
                      child: Center(
                          child: Text(
                        "Sepetinizde ürün bulunmamaktadır.",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w500,
                          color:
                              themeMode ? AppTheme.black12 : AppTheme.white24,
                        ),
                      )),
                    );
                  }
                } else {
                  return SizedBox(
                    width: deviceWidth,
                    height: deviceHeight * .4,
                    child: Center(
                        child: CupertinoActivityIndicator(
                      color: themeMode ? AppTheme.black1 : AppTheme.white1,
                      radius: 12,
                    )),
                  );
                }
              },
            ),
            _orderSummary(),
          ],
        ),
      ),
    );
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
                text: ' (2)',
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
              "Rosebella",
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
                    width: 82,
                    height: 82,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://s4.gifyu.com/images/product_2.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: AppTheme.white21),
                    ),
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
                        const SizedBox(
                          height: 25,
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
                padding: EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                      child: MaterialButton(
                          minWidth: 30,
                          height: 31,
                          elevation: 0,
                          color: int.parse(basket.quantity!) == 1
                              ? themeMode
                                  ? AppTheme.white1.withOpacity(.5)
                                  : AppTheme.black7.withOpacity(.5)
                              : themeMode
                                  ? AppTheme.white1
                                  : AppTheme.black7,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: themeMode
                                    ? AppTheme.blue2
                                    : AppTheme.white15,
                              ),
                            ),
                          ),
                          onPressed: () {
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
                            } else {
                              setState(() {});
                            }
                          }),
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
                    SizedBox(
                      width: 30,
                      child: MaterialButton(
                          minWidth: 30,
                          height: 31,
                          elevation: 0,
                          color: themeMode ? AppTheme.white1 : AppTheme.black7,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: themeMode
                                    ? AppTheme.blue2
                                    : AppTheme.white15,
                              ),
                            ),
                          ),
                          onPressed: () {
                            BasketServices()
                                .updateProductInBasketCall(
                                    productId: basket.productId!,
                                    quantity:
                                        "${int.parse(basket.quantity!) + 1}")
                                .then((bool value) {
                              if (value) {
                                setState(() {});
                              }
                            });
                          }),
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
                        showAlertDialog(
                            context: context,
                            titleText: "Silmek İstediğinizden Emin misiniz ? ",
                            buttonText: "Sil",
                            buttonColor: Colors.red.shade600,
                            onPressed: () {
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
                              color:
                                  themeMode ? AppTheme.blue3 : AppTheme.white1,
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
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: basket.product!.price ?? '0.0 ',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                themeMode ? AppTheme.green3 : AppTheme.green4,
                          ),
                        ),
                        TextSpan(
                          text: "₺",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color:
                                themeMode ? AppTheme.green3 : AppTheme.green4,
                          ),
                        )
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "Adet başı ücret 8,5 ",
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                          ),
                        ),
                        TextSpan(
                          text: "₺",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                          ),
                        )
                      ])),
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
        padding: const EdgeInsets.only(
          top: 15,
          left: 25,
          right: 25,
          bottom: 60,
        ),
        child: Column(
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
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: '3.298,94 ',
                        style: TextStyle(
                          fontSize: 26,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w500,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                        ),
                      ),
                      TextSpan(
                        text: "₺",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                        ),
                      )
                    ])),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            MaterialButton(
                minWidth: deviceWidth,
                height: 52,
                elevation: 0,
                color: AppTheme.green2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Text(
                  'Sepeti Onayla',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.white1),
                ),
                onPressed: () {
                  showAlertDialog(
                      context: context,
                      titleText:
                          'Siparişi Onaylamak istediğinizde emin misiniz ?',
                      buttonText: 'Onayla',
                      buttonColor: AppTheme.green1,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ShoppingSummarySubpage(),
                        ));
                        BasketServices().emptyBasketCall();
                      });
                }),
            SizedBox(height: 36),
          ],
        ));
  }

  void showAlertDialog(
      {required BuildContext context,
      required String titleText,
      required String buttonText,
      required buttonColor,
      required VoidCallback onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            width: deviceWidth,
            padding: const EdgeInsets.all(16.0),
            height: 150,
            decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.white1
                    : AppTheme.black12,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titleText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w500,
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.black16
                            : AppTheme.white14,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 28.0,
                      decoration: BoxDecoration(
                          color: AppTheme.blue3,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
                      child: MaterialButton(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            "Kapat",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white1),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Container(
                      height: 28.0,
                      decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16))),
                      child: MaterialButton(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        onPressed: onPressed,
                        child: Text(
                          buttonText,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.white1),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
