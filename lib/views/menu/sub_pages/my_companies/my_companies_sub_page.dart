import 'dart:ui';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/company/company_model.dart';
import 'package:b2geta_mobile/models/member/address_model.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/company/company_services.dart';
import 'package:b2geta_mobile/services/member/member_addresses_services.dart';
import 'package:b2geta_mobile/views/custom_widgets/custom_appbar.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_companies/add_company_sub_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MyCompaniesSubPage extends StatefulWidget {
  const MyCompaniesSubPage({Key? key}) : super(key: key);

  @override
  State<MyCompaniesSubPage> createState() => _MyCompaniesSubPageState();
}

class _MyCompaniesSubPageState extends State<MyCompaniesSubPage> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  void initState() {
    CompanyServices().listMyCompaniesCall();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
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
                    'My Companies'.tr,
                    style: TextStyle(
                      fontFamily: AppTheme.appFontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                    ),
                  ),
                  SizedBox(height: 21),
                  MaterialButton(
                      minWidth: deviceWidth,
                      height: 52,
                      elevation: 0,
                      color: AppTheme.blue2,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Text(
                        'Add Company'.tr,
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
                                  AddCompanySubPage(operation: 'Add'),
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
                  height: 1,
                  color: themeMode ? AppTheme.white21 : AppTheme.black28,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 28, 0, 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name'.tr,
                              style: TextStyle(
                                fontFamily: AppTheme.appFontFamily,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.white15,
                              ),
                            ),
                            Text(
                              'Test Firma',
                              style: TextStyle(
                                fontFamily: AppTheme.appFontFamily,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: themeMode
                                    ? AppTheme.blue2
                                    : AppTheme.white1,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Role:'.tr,
                                      style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.white15),
                                    ),
                                    Text(
                                      'Admin'.tr,
                                      style: TextStyle(
                                        fontFamily: AppTheme.appFontFamily,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: themeMode
                                            ? AppTheme.blue3
                                            : AppTheme.white1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 48),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status:'.tr,
                                      style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.white15),
                                    ),
                                    Text(
                                      'Approved'.tr,
                                      style: TextStyle(
                                        fontFamily: AppTheme.appFontFamily,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: themeMode
                                            ? AppTheme.blue3
                                            : AppTheme.white1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 26),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                  minWidth: deviceWidth,
                                  height: 47,
                                  elevation: 0,
                                  color: AppTheme.blue2,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9)),
                                  ),
                                  child: Text(
                                    'Edit'.tr,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.white1),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AddCompanySubPage(
                                                  operation: 'Edit'),
                                        ));
                                  }),
                            ),
                            SizedBox(width: 9),
                            Expanded(
                              child: MaterialButton(
                                  minWidth: deviceWidth,
                                  height: 47,
                                  elevation: 0,
                                  // color: AppTheme.green1,
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: AppTheme.green1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9)),
                                  ),
                                  child: Text(
                                    'Choose'.tr,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.green1),
                                  ),
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: deviceWidth,
                  height: 1,
                  color: themeMode ? AppTheme.white21 : AppTheme.black28,
                ),
              ],
            ),
            const SizedBox(height: 90),
            Visibility(
              visible: false,
              child: SizedBox(
                width: deviceWidth,
                height: deviceHeight - 215,
                child: FutureBuilder<List<AddressModel>>(
                  future: locator<MemberAddressesServices>().getAllCall(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 9),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: themeMode
                                      ? AppTheme.white1
                                      : AppTheme.black7,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 2,
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
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Expanded(
                                            flex: 2,
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
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Expanded(
                                            flex: 2,
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
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 28),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
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
                                          Spacer(),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
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
                                          Spacer(),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
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
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                AddCompanySubPage(
                                                                  passedObject:
                                                                      // address

                                                                      CompanyModel(),
                                                                  operation:
                                                                      'Edit',
                                                                ))).then(
                                                        (_) => setState(() {}));
                                                  }),
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
                                                  onPressed: () {
                                                    debugPrint(
                                                        "Address Id: ${address.id}");

                                                    deleteConfirmDialog(
                                                        address.id.toString());
                                                  }),
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
                          color: themeMode ? AppTheme.black1 : AppTheme.white1,
                          radius: 12,
                        )),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteConfirmDialog(String addressId) {
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
                        Expanded(
                          child: Text(
                            'Remove Dialog'.tr,
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
                              color: themeMode
                                  ? AppTheme.black16
                                  : AppTheme.black18,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
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
                        const SizedBox(
                          width: 16,
                        ),
                        ButtonTheme(
                          height: 32,
                          child: MaterialButton(
                              elevation: 0,
                              color: Colors.red.shade600,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Text(
                                'Remove'.tr,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.white1),
                              ),
                              onPressed: () {
                                locator<MemberAddressesServices>()
                                    .deleteAddressCall(id: addressId)
                                    .then((value) {
                                  if (value == true) {
                                    debugPrint(
                                        "ADDRESS HAS SUCCESSFULLY DELETED");
                                    Navigator.of(context).pop();
                                    setState(() {});
                                  } else {
                                    debugPrint("ADDRESS HAS NOT DELETED");
                                    Navigator.of(context).pop();
                                    operationFailedDialog(context);
                                  }
                                });
                              }),
                        ),
                      ],
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
