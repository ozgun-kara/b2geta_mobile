import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/member/address_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/member/addresses/member_addresses_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CompanyAddressesSubPage extends StatefulWidget {
  const CompanyAddressesSubPage({Key? key}) : super(key: key);

  @override
  State<CompanyAddressesSubPage> createState() =>
      _CompanyAddressesSubPageState();
}

class _CompanyAddressesSubPageState extends State<CompanyAddressesSubPage> {
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
      backgroundColor: themeMode ? AppTheme.white36 : AppTheme.black12,
      appBar: AppBar(
          toolbarHeight: 68,
          backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/back.png',
                width: 23,
                height: 17,
                color: AppTheme.white15,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
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
            const SizedBox(height: 1),
            Container(
              width: deviceWidth,
              height: 32,
              decoration: BoxDecoration(
                color: themeMode ? AppTheme.white1 : AppTheme.black5,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 26,
                    color: Color.fromRGBO(41, 67, 214, 0.05),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Edit Address Page Route'.tr,
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.white15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            SizedBox(
              width: deviceWidth,
              height: deviceHeight - 215,
              child: FutureBuilder<List<AddressModel>>(
                future: MemberAddressesServices().getAllCall(
                    queryParameters: {"offset": "2", "limit": "10"}),
                builder: (context, data) {
                  if (data.hasData) {
                    var addressList = data.data;

                    return ListView.separated(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: addressList!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                      itemBuilder: ((context, index) {
                        var address = addressList[index];

                        return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: Container(
                              decoration: BoxDecoration(
                                color: themeMode
                                    ? AppTheme.white1
                                    : AppTheme.black7,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                  width: 1,
                                  color: themeMode
                                      ? AppTheme.white35
                                      : AppTheme.black18,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 21, 24, 21),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Name'.tr,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppTheme.white15,
                                                ),
                                              ),
                                              Text(
                                                address.name ?? '',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
                                                  color: themeMode
                                                      ? AppTheme.blue3
                                                      : AppTheme.white1,
                                                ),
                                              ),
                                              const SizedBox(height: 28),
                                              Text(
                                                'City'.tr,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppTheme.white15,
                                                ),
                                              ),
                                              Text(
                                                address.city!.name ?? '',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Address'.tr,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppTheme.white15,
                                                ),
                                              ),
                                              Text(
                                                address.address ?? '',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
                                                  color: themeMode
                                                      ? AppTheme.blue3
                                                      : AppTheme.white1,
                                                ),
                                              ),
                                              const SizedBox(height: 28),
                                              Text(
                                                'Country'.tr,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppTheme.white15,
                                                ),
                                              ),
                                              Text(
                                                address.country!.name ?? '',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'District'.tr,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppTheme.white15,
                                                ),
                                              ),
                                              Text(
                                                address.district!.name ?? '',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
                                                  color: themeMode
                                                      ? AppTheme.blue3
                                                      : AppTheme.white1,
                                                ),
                                              ),
                                              const SizedBox(height: 28),
                                              Text(
                                                'Postal Code'.tr,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppTheme.white15,
                                                ),
                                              ),
                                              Text(
                                                address.postalCode ?? '',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
                                                  color: themeMode
                                                      ? AppTheme.blue3
                                                      : AppTheme.white1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            height: 30,
                                            child: MaterialButton(
                                                height: 30,
                                                color: AppTheme.blue2,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                ),
                                                elevation: 0,
                                                child: Text(
                                                  'Edit'.tr,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: AppTheme
                                                          .appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppTheme.white1),
                                                ),
                                                onPressed: () {}),
                                          ),
                                        ),
                                        const SizedBox(width: 17),
                                        Expanded(
                                          child: SizedBox(
                                            height: 30,
                                            child: MaterialButton(
                                                height: 30,
                                                color: AppTheme.red4,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                ),
                                                elevation: 0,
                                                child: Text(
                                                  'Remove'.tr,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: AppTheme
                                                          .appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppTheme.white1),
                                                ),
                                                onPressed: () {}),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  } else {
                    return SizedBox(
                      height: deviceWidth + 115,
                      child: Center(
                          child: CupertinoActivityIndicator(
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black1
                            : AppTheme.white1,
                        radius: 12,
                      )),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: SizedBox(
                height: 47,
                child: MaterialButton(
                    height: 47,
                    minWidth: deviceWidth,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    elevation: 0,
                    child: Text(
                      'Add an Address'.tr,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w600,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1),
                    ),
                    onPressed: () {}),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
