import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/categories/category_model.dart';
import 'package:b2geta_mobile/models/products/product_detail_model.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_app_bar.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_text_form_field.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/add_product_image_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/my_products_sub_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'dart:ui';

class AddProductSubPage extends StatefulWidget {
  const AddProductSubPage(
      {Key? key, this.passedObject, required this.operation})
      : super(key: key);

  final ProductDetailModel? passedObject;
  final String operation;

  @override
  State<AddProductSubPage> createState() => _AddProductSubPageState();
}

class _AddProductSubPageState extends State<AddProductSubPage> {
  ScrollController scrollController = ScrollController();
  GlobalKey<FormState> productGlobalKey = GlobalKey<FormState>();

  final productNameController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final productPriceController = TextEditingController();
  final productSummaryController = TextEditingController();
  final categoriesController = TextEditingController();
  final brandController = TextEditingController();
  final statusController = TextEditingController();

  var categoryId;
  var brandId;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  void initState() {
    Provider.of<MenuPageProvider>(context, listen: false).selectedCategory =
        null;
    Provider.of<MenuPageProvider>(context, listen: false).selectedBrand = null;
    Provider.of<MenuPageProvider>(context, listen: false).selectedCurrency =
        null;
    Provider.of<MenuPageProvider>(context, listen: false).selectedStatus = null;

    Provider.of<MenuPageProvider>(context, listen: false).categoryList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).brandList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).currencyList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).statusList.clear();

    Provider.of<MenuPageProvider>(context, listen: false).fetchCategoryList();
    Provider.of<MenuPageProvider>(context, listen: false).fetchBrandList();

    Provider.of<MenuPageProvider>(context, listen: false).currencyList = [
      'EUR',
      'TRY',
      'USD',
    ];
    Provider.of<MenuPageProvider>(context, listen: false).statusList = [
      'Active'.tr,
      'Passive'.tr
    ];

    if (widget.operation == 'Edit') {
      productNameController.text = widget.passedObject!.productName.toString();
      productDescriptionController.text =
          widget.passedObject!.productDescription.toString();
      productPriceController.text = widget.passedObject!.price.toString();
      productSummaryController.text =
          widget.passedObject!.productSummary.toString();

      categoryId = widget.passedObject!.categories!.first!.categoryId;
      Provider.of<MenuPageProvider>(context, listen: false).selectedCategory =
          widget.passedObject!.categories!.first!.categoryName;

      brandId = widget.passedObject!.brand!.id;
      Provider.of<MenuPageProvider>(context, listen: false).selectedBrand =
          widget.passedObject!.brand!.name;

      Provider.of<MenuPageProvider>(context, listen: false).selectedCurrency =
          widget.passedObject!.currency;

      Provider.of<MenuPageProvider>(context, listen: false).selectedStatus =
          widget.passedObject!.status == '1' ? 'Active'.tr : 'Passive'.tr;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    var categoryList =
        Provider.of<MenuPageProvider>(context, listen: true).categoryList;
    var brandList =
        Provider.of<MenuPageProvider>(context, listen: true).brandList;
    var currencyList =
        Provider.of<MenuPageProvider>(context, listen: true).currencyList;
    var statusList =
        Provider.of<MenuPageProvider>(context, listen: true).statusList;

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
              Consumer<MenuPageProvider>(
                builder: (context, menuPageProvider, child) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 37),
                    child: Form(
                      key: productGlobalKey,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    'Categories'.tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white14,
                                    ),
                                  ),
                                ),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  // alignment: AlignmentDirectional.center,
                                  isExpanded: true,
                                  // hint: Text(
                                  //   'Categories'.tr,
                                  //   style: TextStyle(
                                  //     fontSize: 14,
                                  //     fontFamily: AppTheme.appFontFamily,
                                  //     fontWeight: FontWeight.w400,
                                  //     color: Provider.of<ThemeProvider>(context)
                                  //         .themeMode ==
                                  //         "light"
                                  //         ? AppTheme.blue3
                                  //         : AppTheme.white14,
                                  //   ),
                                  // ),
                                  items: categoryList
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item.categoryName,
                                            child: Text(
                                              item.categoryName ?? '',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.blue3
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: menuPageProvider.selectedCategory,

                                  onChanged: (value) {
                                    menuPageProvider.updateSelectedCategory(
                                        value as String);

                                    var categoryIndex = categoryList.indexWhere(
                                        ((element) =>
                                            element.categoryName == value));
                                    if (categoryIndex != -1) {
                                      debugPrint(
                                          'CATEGORY INDEX: $categoryIndex');
                                      debugPrint(
                                          'CATEGORY ID: ${categoryList[categoryIndex].id}');

                                      categoryId =
                                          categoryList[categoryIndex].id;
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
                                  buttonPadding: const EdgeInsets.only(
                                      left: 25, right: 17),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // border:
                                    //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),

                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white39
                                        : AppTheme.black18,
                                  ),
                                  // buttonElevation: 2,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 32),
                                  // dropdownMaxHeight: deviceHeight * 0.4,
                                  dropdownMaxHeight: 350,
                                  // dropdownWidth: deviceWidth,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
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
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 16, 16, 4),
                                    child: TextFormField(
                                      controller: categoriesController,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue3
                                                : AppTheme.white1,
                                      ), // WHILE WRITING
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 12,
                                        ),
                                        hintText: 'Search...'.tr,
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w400,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.blue3
                                              : AppTheme.white14,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: AppTheme.white15,
                                              width: 1,
                                            )),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: AppTheme.white15,
                                              width: 1,
                                            )),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Provider.of<ThemeProvider>(
                                                            context)
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
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          CustomTextFormField(
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
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Product Description Validate'.tr;
                              }
                              return null;
                            },
                            controller: productDescriptionController,
                            hintText: 'Product Description'.tr,
                            minLines: 1,
                            maxLines: 5,
                          ),
                          const SizedBox(height: 13),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    'Brand'.tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white14,
                                    ),
                                  ),
                                ),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  // alignment: AlignmentDirectional.center,
                                  isExpanded: true,
                                  // hint: Text(
                                  //   'Brand'.tr,
                                  //   style: TextStyle(
                                  //     fontSize: 14,
                                  //     fontFamily: AppTheme.appFontFamily,
                                  //     fontWeight: FontWeight.w400,
                                  //     color: Provider.of<ThemeProvider>(context)
                                  //                 .themeMode ==
                                  //             "light"
                                  //         ? AppTheme.blue3
                                  //         : AppTheme.white14,
                                  //   ),
                                  // ),
                                  items: brandList
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item.name,
                                            child: Text(
                                              item.name ?? '',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.blue3
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: menuPageProvider.selectedBrand,

                                  onChanged: (value) {
                                    menuPageProvider
                                        .updateSelectedBrand(value as String);

                                    var brandIndex = brandList.indexWhere(
                                        ((element) => element.name == value));
                                    if (brandIndex != -1) {
                                      debugPrint('BRAND INDEX: $brandIndex');
                                      debugPrint(
                                          'BRAND ID: ${brandList[brandIndex].id}');

                                      brandId = brandList[brandIndex].id;
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
                                  buttonPadding: const EdgeInsets.only(
                                      left: 25, right: 17),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // border:
                                    //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),

                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white39
                                        : AppTheme.black18,
                                  ),
                                  // buttonElevation: 2,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 32),
                                  // dropdownMaxHeight: deviceHeight * 0.4,
                                  dropdownMaxHeight: 350,
                                  // dropdownWidth: deviceWidth,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white39
                                        : AppTheme.black18,
                                  ),
                                  // dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 4,
                                  scrollbarAlwaysShow: true,
                                  // offset: const Offset(0, 180),

                                  searchController: brandController,
                                  searchInnerWidget: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 16, 16, 4),
                                    child: TextFormField(
                                      controller: brandController,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue3
                                                : AppTheme.white1,
                                      ), // WHILE WRITING
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 12,
                                        ),
                                        hintText: 'Search...'.tr,
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w400,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.blue3
                                              : AppTheme.white14,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: AppTheme.white15,
                                              width: 1,
                                            )),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: AppTheme.white15,
                                              width: 1,
                                            )),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Provider.of<ThemeProvider>(
                                                            context)
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
                                      brandController.clear();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    'Currency'.tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white14,
                                    ),
                                  ),
                                ),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  // alignment: AlignmentDirectional.center,
                                  isExpanded: true,
                                  // hint: Text(
                                  //   'Currency'.tr,
                                  //   style: TextStyle(
                                  //     fontSize: 14,
                                  //     fontFamily: AppTheme.appFontFamily,
                                  //     fontWeight: FontWeight.w400,
                                  //     color: Provider.of<ThemeProvider>(context)
                                  //                 .themeMode ==
                                  //             "light"
                                  //         ? AppTheme.blue3
                                  //         : AppTheme.white14,
                                  //   ),
                                  // ),

                                  items: currencyList
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.blue3
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: menuPageProvider.selectedCurrency,
                                  onChanged: (value) {
                                    menuPageProvider.updateSelectedCurrency(
                                        value as String);
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
                                  buttonPadding: const EdgeInsets.only(
                                      left: 25, right: 17),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // border:
                                    //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),

                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white39
                                        : AppTheme.black18,
                                  ),
                                  // buttonElevation: 2,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 32),
                                  // dropdownMaxHeight: deviceHeight * 0.4,
                                  dropdownMaxHeight: 350,
                                  // dropdownWidth: deviceWidth,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white39
                                        : AppTheme.black18,
                                  ),
                                  // dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 4,
                                  scrollbarAlwaysShow: true,
                                  // offset: const Offset(0, 180),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Price Validate'.tr;
                              }
                              return null;
                            },
                            controller: productPriceController,
                            hintText: 'Price'.tr,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 13),
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Product Summary Validate'.tr;
                              }
                              return null;
                            },
                            controller: productSummaryController,
                            hintText: 'Product Summary'.tr,
                            keyboardType: TextInputType.text,
                            minLines: 1,
                            maxLines: 5,
                          ),
                          const SizedBox(height: 13),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    'Status'.tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white14,
                                    ),
                                  ),
                                ),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  // alignment: AlignmentDirectional.center,
                                  isExpanded: true,
                                  // hint: Text(
                                  //   'Status'.tr,
                                  //   style: TextStyle(
                                  //     fontSize: 14,
                                  //     fontFamily: AppTheme.appFontFamily,
                                  //     fontWeight: FontWeight.w400,
                                  //     color: Provider.of<ThemeProvider>(context)
                                  //                 .themeMode ==
                                  //             "light"
                                  //         ? AppTheme.blue3
                                  //         : AppTheme.white14,
                                  //   ),
                                  // ),

                                  items: statusList
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.blue3
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: menuPageProvider.selectedStatus,
                                  onChanged: (value) {
                                    menuPageProvider
                                        .updateSelectedStatus(value as String);
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
                                  buttonPadding: const EdgeInsets.only(
                                      left: 25, right: 17),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // border:
                                    //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),

                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white39
                                        : AppTheme.black18,
                                  ),
                                  // buttonElevation: 2,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 32),
                                  // dropdownMaxHeight: deviceHeight * 0.4,
                                  dropdownMaxHeight: 350,
                                  // dropdownWidth: deviceWidth,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white39
                                        : AppTheme.black18,
                                  ),
                                  // dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 4,
                                  scrollbarAlwaysShow: true,
                                  // offset: const Offset(0, 180),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 28),
                          MaterialButton(
                              minWidth: deviceWidth,
                              height: 52,
                              elevation: 0,
                              color: AppTheme.green1,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
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
                                if (productGlobalKey.currentState!.validate()) {
                                  if (categoryId.toString() != 'null' &&
                                      brandId.toString() != 'null' &&
                                      menuPageProvider.selectedCurrency
                                              .toString() !=
                                          'null' &&
                                      menuPageProvider.selectedStatus
                                              .toString() !=
                                          'null') {
                                    if (widget.operation == 'Add') {
                                      ProductDetailModel product =
                                          ProductDetailModel(
                                        accountId: '56',
                                        userId: '57',
                                        productName: productNameController.text,
                                        productDescription:
                                            productDescriptionController.text,
                                        productSummary:
                                            productSummaryController.text,
                                      );

                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                AddProductImageSubPage(
                                                    accountId: '',
                                                    categoryId: categoryId,
                                                    productName:
                                                        productNameController
                                                            .text,
                                                    productDescription:
                                                        productDescriptionController
                                                            .text,
                                                    productSummary:
                                                        productSummaryController
                                                            .text,
                                                    brand: brandId,
                                                    price:
                                                        productPriceController
                                                            .text,
                                                    currency: menuPageProvider
                                                        .selectedCurrency
                                                        .toString(),
                                                    status: menuPageProvider
                                                                .selectedStatus ==
                                                            'Active'.tr
                                                        ? '1'
                                                        : '0'),
                                            transitionDuration:
                                                const Duration(milliseconds: 0),
                                            reverseTransitionDuration:
                                                const Duration(milliseconds: 0),
                                            transitionsBuilder: (_, a, __, c) =>
                                                FadeTransition(
                                                    opacity: a, child: c),
                                          ));
                                    } else {
                                      locator<ProductsServices>()
                                          .updateProductCall(
                                              productId:
                                                  widget.passedObject!.id!,
                                              categoryId: widget
                                                  .passedObject!.categories
                                                  .toString(),
                                              productName: widget
                                                  .passedObject!.productName
                                                  .toString(),
                                              productDescription: widget
                                                  .passedObject!
                                                  .productDescription!,
                                              productSummary: widget
                                                  .passedObject!
                                                  .productSummary!,
                                              brand: widget
                                                  .passedObject!.brand!.id
                                                  .toString(),
                                              price:
                                                  widget.passedObject!.price!,
                                              currency: widget
                                                  .passedObject!.currency!,
                                              status:
                                                  widget.passedObject!.status!)
                                          .then((value) {
                                        if (value == true) {
                                          debugPrint(
                                              "PRODUCT HAS SUCCESSFULLY UPDATED");

                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (_, __, ___) =>
                                                    const MyProductsSubPage(),
                                                transitionDuration:
                                                    const Duration(
                                                        milliseconds: 0),
                                                reverseTransitionDuration:
                                                    const Duration(
                                                        milliseconds: 0),
                                                transitionsBuilder: (_, a, __,
                                                        c) =>
                                                    FadeTransition(
                                                        opacity: a, child: c),
                                              ),
                                              (route) => route.isFirst);
                                        } else {
                                          debugPrint("PRODUCT HAS NOT UPDATED");
                                          operationFailedDialog(context);
                                        }
                                      });
                                    }
                                  } else {
                                    validationErrorDialog(context);
                                  }
                                }
                              }),
                        ],
                      ),
                    ),
                  );
                },
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
        hintText: "",
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
