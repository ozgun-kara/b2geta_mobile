import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/custom_widgets/custom_appbar.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/add_product_image_sub_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'dart:ui';

class AddProductSubPage extends StatefulWidget {
  const AddProductSubPage({Key? key, required this.operation})
      : super(key: key);

  final String operation;

  @override
  State<AddProductSubPage> createState() => _AddProductSubPageState();
}

class _AddProductSubPageState extends State<AddProductSubPage> {
  ScrollController scrollController = ScrollController();
  GlobalKey<FormState> addressGlobalKey = GlobalKey<FormState>();

  final productNameController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final priceController = TextEditingController();
  final productSummaryController = TextEditingController();

  final categoriesController = TextEditingController();
  final brandController = TextEditingController();
  final currencyController = TextEditingController();
  final statusController = TextEditingController();

  var categoryId;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  void initState() {
    Provider.of<MenuPageProvider>(context, listen: false).selectedCategory =
        null;

    Provider.of<MenuPageProvider>(context, listen: false).categoryList.clear();

    Provider.of<MenuPageProvider>(context, listen: false).fetchCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    var categoryList =
        Provider.of<MenuPageProvider>(context, listen: false).categoryList;

    return Scaffold(
        backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black24,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 27.5),
              Text(
                'Add Product'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w600,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 37),
                child: Form(
                  key: addressGlobalKey,
                  child: Column(
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          // alignment: AlignmentDirectional.center,
                          isExpanded: true,
                          hint: Text(
                            'Categories'.tr,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue3
                                  : AppTheme.white14,
                            ),
                          ),
                          items: categoryList
                              .map((item) => DropdownMenuItem<String>(
                                    value: item.categoryName,
                                    child: Text(
                                      item.categoryName ?? '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue3
                                                : AppTheme.white1,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: Provider.of<MenuPageProvider>(context)
                              .selectedCategory,

                          onChanged: (value) {
                            Provider.of<MenuPageProvider>(context,
                                    listen: false)
                                .updateSelectedCategory(value as String);

                            var categoryIndex = categoryList.indexWhere(
                                ((element) => element.categoryName == value));
                            if (categoryIndex != -1) {
                              debugPrint('CATEGORY INDEX: $categoryIndex');
                              debugPrint(
                                  'CATEGORY ID: ${categoryList[categoryIndex].id}');

                              categoryId = categoryList[categoryIndex].id;

                              Provider.of<MenuPageProvider>(context,
                                      listen: false)
                                  .selectedCategory = null;
                            }
                          },

                          icon: Center(
                            child: Image.asset(
                              'assets/icons/dropdown.png',
                              width: 10,
                              height: 6,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue3
                                  : AppTheme.white15,
                            ),
                          ),
                          iconSize: 24,
                          // iconEnabledColor: Colors.yellow,
                          // iconDisabledColor: Colors.grey,
                          // icon: Container(),
                          buttonHeight: 57,
                          buttonWidth: deviceWidth,
                          buttonPadding:
                              const EdgeInsets.only(left: 25, right: 17),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // border:
                            //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),

                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.white39
                                    : AppTheme.black18,
                          ),
                          // buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 32),
                          // dropdownMaxHeight: deviceHeight * 0.4,
                          dropdownMaxHeight: 350,
                          // dropdownWidth: deviceWidth,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.white39
                                    : AppTheme.black18,
                          ),
                          // dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 4,
                          scrollbarAlwaysShow: true,
                          // offset: const Offset(0, 180),

                          searchController: categoriesController,
                          searchInnerWidget: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                            child: TextFormField(
                              controller: categoriesController,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w500,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ), // WHILE WRITING
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                hintText: 'Search...'.tr,
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w400,
                                  color: Provider.of<ThemeProvider>(context)
                                              .themeMode ==
                                          "light"
                                      ? AppTheme.blue3
                                      : AppTheme.white14,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: AppTheme.white15,
                                      width: 1,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: AppTheme.white15,
                                      width: 1,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.blue3
                                        : AppTheme.white1,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          searchMatchFn: (item, searchValue) {
                            debugPrint("ITEM:${item.value}");

                            return (item.value
                                .toLowerCase()
                                .contains(searchValue.toLowerCase()));
                          },
                          //This to clear the search value when you close the menu
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              categoriesController.clear();
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      textFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Product Name Validate'.tr;
                          }
                          return null;
                        },
                        controller: productNameController,
                        hintText: 'Product Name'.tr,
                      ),
                      const SizedBox(height: 13),
                      textFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Product Description Validate'.tr;
                          }
                          return null;
                        },
                        controller: productDescriptionController,
                        hintText: 'Product Description'.tr,
                      ),
                      const SizedBox(height: 13),
                      const SizedBox(height: 13),
                      const SizedBox(
                        height: 13,
                      ),
                      textFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Price Validate'.tr;
                          }
                          return null;
                        },
                        controller: priceController,
                        hintText: 'Price'.tr,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 13),
                      textFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Product Summary Validate'.tr;
                          }
                          return null;
                        },
                        controller: productSummaryController,
                        hintText: 'Product Summary'.tr,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 13),
                      const SizedBox(height: 28),
                      MaterialButton(
                          minWidth: deviceWidth,
                          height: 52,
                          elevation: 0,
                          color: AppTheme.green1,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            widget.operation == 'Add'
                                ? 'Continue'.tr
                                : 'Edit'.tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white1),
                          ),
                          onPressed: () {
                            if (widget.operation == 'Add') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddProductImageSubPage(),
                                  ));
                            } else {
                              Navigator.pop(context);
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void validationErrorDialog(BuildContext context) {
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
                            'Validation Error Dialog'.tr,
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

  TextFormField textFormField(
      {String? Function(String?)? validator,
      required TextEditingController controller,
      required String hintText,
      TextInputType? keyboardType,
      int? maxLines}) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines ?? 1,
      style: TextStyle(
          fontSize: 14,
          fontFamily: AppTheme.appFontFamily,
          fontWeight: FontWeight.w500,
          color: themeMode ? AppTheme.blue3 : AppTheme.white1), // WHILE WRITING
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
        filled: true,
        fillColor: themeMode ? AppTheme.white39 : AppTheme.black18,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          fontFamily: AppTheme.appFontFamily,
          fontWeight: FontWeight.w400,
          color: themeMode ? AppTheme.blue3 : AppTheme.white14,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: themeMode ? AppTheme.blue2 : AppTheme.white1,
            width: 1,
          ),
        ),
      ),
    );
  }
}
