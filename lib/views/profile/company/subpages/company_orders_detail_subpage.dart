import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/dummy_models/company_order_dummy_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyOrdersDetailSubpage extends StatefulWidget {
  const CompanyOrdersDetailSubpage({Key? key, required this.passedObject})
      : super(key: key);

  final CompanyOrderDummyModel passedObject;

  @override
  State<CompanyOrdersDetailSubpage> createState() =>
      _CompanyOrdersDetailSubpageState();
}

class _CompanyOrdersDetailSubpageState
    extends State<CompanyOrdersDetailSubpage> {
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
      appBar: AppBar(
          toolbarHeight: 68,
          backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
          elevation: 0,
          // leading: Padding(
          //   padding: const EdgeInsets.only(left: 8),
          //   child: IconButton(
          //     splashRadius: 24,
          //     icon: Image.asset(
          //       'assets/icons/menu.png',
          //       width: 23,
          //       height: 17,
          //       color: AppTheme.white15,
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
          // leading: SizedBox(),
          leadingWidth: 125.74,
          leading: Padding(
            padding: const EdgeInsets.only(left: 22),
            child: SizedBox(
                width: 103.74,
                height: 14.0,
                child: themeMode
                    ? Image.asset('assets/images/b2geta_logo_light.png')
                    : Image.asset('assets/images/b2geta_logo_dark.png')),
          ),
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
                } else {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setLightMode();
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
        child: Column(
          children: [
            Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white32 : Colors.transparent),
            SizedBox(height: 8),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                    splashRadius: 24,
                    icon: Image.asset(
                      'assets/icons/back-2.png',
                      width: 14,
                      height: 12,
                      color: AppTheme.white15,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Text(
                  "Sipariş Detay #${widget.passedObject.orderNumber}",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w600,
                    color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: themeMode ? AppTheme.white1 : AppTheme.black7,
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.normal,
                    offset: Offset(0, -4),
                    blurRadius: 26,
                    spreadRadius: 0,
                    color: Color(0xFF2B3361).withOpacity(0.10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 21, 21, 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 82,
                          height: 82,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  widget.passedObject.imgUrl.toString()),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(width: 1, color: AppTheme.white21),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: Text(
                            widget.passedObject.title ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color:
                                  themeMode ? AppTheme.blue3 : AppTheme.white1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: deviceWidth,
                      height: 1,
                      color: themeMode ? AppTheme.white21 : AppTheme.black18),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.fromLTRB(21, 27, 21, 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tarih:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white15,
                                    ),
                                  ),
                                  Text(
                                    widget.passedObject.date ?? '',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w600,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    "Satıcı:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white15,
                                    ),
                                  ),
                                  Text(
                                    widget.passedObject.seller ?? '',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w600,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sipariş No:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white15,
                                    ),
                                  ),
                                  Text(
                                    widget.passedObject.orderNumber ?? '',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w600,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    "Miktar:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white15,
                                    ),
                                  ),
                                  Text(
                                    widget.passedObject.quantity ?? '',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w600,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ürün No:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white15,
                                    ),
                                  ),
                                  Text(
                                    widget.passedObject.productNumber ?? '',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w600,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    "Durum:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white15,
                                    ),
                                  ),
                                  widget.passedObject.status == "1"
                                      ? Text(
                                          "Onaylandı",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w600,
                                            color: themeMode
                                                ? AppTheme.green6
                                                : AppTheme.green7,
                                          ),
                                        )
                                      : widget.passedObject.status == "0"
                                          ? Text(
                                              "Değerlendiriliyor",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: themeMode
                                                    ? AppTheme.blue3
                                                    : AppTheme.white1,
                                              ),
                                            )
                                          : Text(
                                              "Reddedildi",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: themeMode
                                                    ? AppTheme.red2
                                                    : AppTheme.red3,
                                              ),
                                            )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 28),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Adres:",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: AppTheme.white15,
                                  ),
                                ),
                                Text(
                                  widget.passedObject.address ?? '',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w600,
                                    color: themeMode
                                        ? AppTheme.blue3
                                        : AppTheme.white1,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  "Toplam Ücret:",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: AppTheme.white15,
                                  ),
                                ),
                                SizedBox(
                                  height: 34,
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: widget.passedObject.totalPayment ??
                                          '',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w500,
                                        color: AppTheme.green3,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "₺",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: AppTheme.green3,
                                      ),
                                    )
                                  ])),
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: "Adet başı ücret ",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.passedObject.unitPayment ?? '',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "₺",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  )
                                ])),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: deviceWidth,
                      height: 1,
                      color: themeMode ? AppTheme.white21 : AppTheme.black18),
                  SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(21, 19, 21, 17),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Image.asset('assets/icons/message.png',
                                    width: 12,
                                    height: 10,
                                    color: AppTheme.white15),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Mesaj Gönder",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: themeMode
                                        ? AppTheme.blue2
                                        : AppTheme.blue10),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 22),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Image.asset('assets/icons/message.png',
                                    width: 12,
                                    height: 10,
                                    color: AppTheme.white15),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Anlaşmazlık Başlat",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: themeMode
                                        ? AppTheme.red2
                                        : AppTheme.red3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // FutureBuilder(
            //   future: DummyService().getCompanyOrdersList(),
            //   builder: (context, data) {
            //     if (data.hasData) {
            //       var productIdList = data.data;
            //
            //       return ListView.separated(
            //         controller: scrollController,
            //         shrinkWrap: true,
            //         itemCount: productIdList!.length,
            //         separatorBuilder: (BuildContext context, int index) {
            //           return SizedBox(height: 8);
            //         },
            //         itemBuilder: ((context, index) {
            //           var items = data.data as List<CompanyOrderDummyModel>;
            //
            //           return InkWell(
            //             onTap: () {
            //               // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailSubpage(productId: productIdList[index], productName: productList["title"].toString(), imageUrl: productList["imgUrl"].toString(),price: productList["price"].toString()),),);
            //             },
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 color:
            //                     themeMode ? AppTheme.white1 : AppTheme.black7,
            //                 boxShadow: [
            //                   BoxShadow(
            //                     blurStyle: BlurStyle.normal,
            //                     offset: Offset(0, -4),
            //                     blurRadius: 26,
            //                     spreadRadius: 0,
            //                     color: Color(0xFF2B3361).withOpacity(0.10),
            //                   ),
            //                 ],
            //               ),
            //               child: Column(
            //                 children: [
            //                   SizedBox(height: 60),
            //                   Padding(
            //                     padding: EdgeInsets.fromLTRB(21, 21, 21, 23),
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         Flexible(
            //                           child: Column(
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               Text(
            //                                 "Tarih:",
            //                                 style: TextStyle(
            //                                   fontSize: 12,
            //                                   fontFamily:
            //                                       AppTheme.appFontFamily,
            //                                   fontWeight: FontWeight.w400,
            //                                   color: AppTheme.white15,
            //                                 ),
            //                               ),
            //                               Text(
            //                                 items[index].date ?? '',
            //                                 style: TextStyle(
            //                                   fontSize: 13,
            //                                   fontFamily:
            //                                       AppTheme.appFontFamily,
            //                                   fontWeight: FontWeight.w600,
            //                                   color: themeMode
            //                                       ? AppTheme.blue3
            //                                       : AppTheme.white1,
            //                                 ),
            //                               ),
            //                               SizedBox(height: 16),
            //                               Text(
            //                                 "Satıcı:",
            //                                 style: TextStyle(
            //                                   fontSize: 12,
            //                                   fontFamily:
            //                                       AppTheme.appFontFamily,
            //                                   fontWeight: FontWeight.w400,
            //                                   color: AppTheme.white15,
            //                                 ),
            //                               ),
            //                               Text(
            //                                 items[index].seller ?? '',
            //                                 style: TextStyle(
            //                                   fontSize: 13,
            //                                   fontFamily:
            //                                       AppTheme.appFontFamily,
            //                                   fontWeight: FontWeight.w600,
            //                                   color: themeMode
            //                                       ? AppTheme.blue3
            //                                       : AppTheme.white1,
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         Flexible(
            //                           child: Column(
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               Text(
            //                                 "Sipariş No:",
            //                                 style: TextStyle(
            //                                   fontSize: 12,
            //                                   fontFamily:
            //                                       AppTheme.appFontFamily,
            //                                   fontWeight: FontWeight.w400,
            //                                   color: AppTheme.white15,
            //                                 ),
            //                               ),
            //                               Text(
            //                                 items[index].orderNumber ?? '',
            //                                 style: TextStyle(
            //                                   fontSize: 13,
            //                                   fontFamily:
            //                                       AppTheme.appFontFamily,
            //                                   fontWeight: FontWeight.w600,
            //                                   color: themeMode
            //                                       ? AppTheme.blue3
            //                                       : AppTheme.white1,
            //                                 ),
            //                               ),
            //                               SizedBox(height: 16),
            //                               Text(
            //                                 "Miktar:",
            //                                 style: TextStyle(
            //                                   fontSize: 12,
            //                                   fontFamily:
            //                                       AppTheme.appFontFamily,
            //                                   fontWeight: FontWeight.w400,
            //                                   color: AppTheme.white15,
            //                                 ),
            //                               ),
            //                               Text(
            //                                 items[index].quantity ?? '',
            //                                 style: TextStyle(
            //                                   fontSize: 13,
            //                                   fontFamily:
            //                                       AppTheme.appFontFamily,
            //                                   fontWeight: FontWeight.w600,
            //                                   color: themeMode
            //                                       ? AppTheme.blue3
            //                                       : AppTheme.white1,
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         Flexible(
            //                           child: Column(
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               Text(
            //                                 "Ürün No:",
            //                                 style: TextStyle(
            //                                   fontSize: 12,
            //                                   fontFamily:
            //                                       AppTheme.appFontFamily,
            //                                   fontWeight: FontWeight.w400,
            //                                   color: AppTheme.white15,
            //                                 ),
            //                               ),
            //                               Text(
            //                                 items[index].productNumber ?? '',
            //                                 style: TextStyle(
            //                                   fontSize: 13,
            //                                   fontFamily:
            //                                       AppTheme.appFontFamily,
            //                                   fontWeight: FontWeight.w600,
            //                                   color: themeMode
            //                                       ? AppTheme.blue3
            //                                       : AppTheme.white1,
            //                                 ),
            //                               ),
            //                               SizedBox(height: 16),
            //                               Text(
            //                                 "Durum:",
            //                                 style: TextStyle(
            //                                   fontSize: 12,
            //                                   fontFamily:
            //                                       AppTheme.appFontFamily,
            //                                   fontWeight: FontWeight.w400,
            //                                   color: AppTheme.white15,
            //                                 ),
            //                               ),
            //                               items[index].status == "1"
            //                                   ? Text(
            //                                       "Onaylandı",
            //                                       style: TextStyle(
            //                                         fontSize: 13,
            //                                         fontFamily:
            //                                             AppTheme.appFontFamily,
            //                                         fontWeight: FontWeight.w600,
            //                                         color: themeMode
            //                                             ? AppTheme.green6
            //                                             : AppTheme.green7,
            //                                       ),
            //                                     )
            //                                   : items[index].status == "0"
            //                                       ? Text(
            //                                           "Değerlendiriliyor",
            //                                           style: TextStyle(
            //                                             fontSize: 13,
            //                                             fontFamily: AppTheme
            //                                                 .appFontFamily,
            //                                             fontWeight:
            //                                                 FontWeight.w600,
            //                                             color: themeMode
            //                                                 ? AppTheme.blue3
            //                                                 : AppTheme.white1,
            //                                           ),
            //                                         )
            //                                       : Text(
            //                                           "Reddedildi",
            //                                           style: TextStyle(
            //                                             fontSize: 13,
            //                                             fontFamily: AppTheme
            //                                                 .appFontFamily,
            //                                             fontWeight:
            //                                                 FontWeight.w600,
            //                                             color: themeMode
            //                                                 ? AppTheme.red2
            //                                                 : AppTheme.red3,
            //                                           ),
            //                                         )
            //                             ],
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   Container(
            //                       width: deviceWidth,
            //                       height: 1,
            //                       color: themeMode
            //                           ? AppTheme.white21
            //                           : AppTheme.black18),
            //                   SizedBox(height: 2),
            //                   Padding(
            //                     padding:
            //                         const EdgeInsets.fromLTRB(21, 8, 21, 8),
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         InkWell(
            //                           onTap: () {},
            //                           child: Row(
            //                             children: [
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     bottom: 2),
            //                                 child: Image.asset(
            //                                     'assets/icons/message.png',
            //                                     width: 12,
            //                                     height: 10,
            //                                     color: AppTheme.white15),
            //                               ),
            //                               SizedBox(width: 5),
            //                               Text(
            //                                 "Mesaj Gönder",
            //                                 style: TextStyle(
            //                                     fontSize: 12,
            //                                     fontFamily:
            //                                         AppTheme.appFontFamily,
            //                                     fontWeight: FontWeight.w700,
            //                                     color: themeMode
            //                                         ? AppTheme.blue2
            //                                         : AppTheme.blue10),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         SizedBox(width: 20),
            //                         InkWell(
            //                           onTap: () {},
            //                           child: Row(
            //                             children: [
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     bottom: 2),
            //                                 child: Image.asset(
            //                                     'assets/icons/arrow.png',
            //                                     width: 8,
            //                                     height: 8,
            //                                     color: AppTheme.white15),
            //                               ),
            //                               SizedBox(width: 6),
            //                               Text(
            //                                 "Detaylar",
            //                                 style: TextStyle(
            //                                     fontSize: 12,
            //                                     fontFamily:
            //                                         AppTheme.appFontFamily,
            //                                     fontWeight: FontWeight.w700,
            //                                     color: themeMode
            //                                         ? AppTheme.blue2
            //                                         : AppTheme.blue10),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           );
            //         }),
            //       );
            //     } else {
            //       return SizedBox(
            //         height: deviceWidth + 115,
            //         child: Center(
            //             child: CupertinoActivityIndicator(
            //           color: Provider.of<ThemeProvider>(context).themeMode ==
            //                   "light"
            //               ? AppTheme.black1
            //               : AppTheme.white1,
            //           radius: 12,
            //         )),
            //       );
            //     }
            //   },
            // ),
            SizedBox(height: 82),
          ],
        ),
      ),
    );
  }
}
