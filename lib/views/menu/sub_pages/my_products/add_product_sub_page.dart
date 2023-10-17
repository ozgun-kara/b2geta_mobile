// ignore_for_file: iterable_contains_unrelated_type

import 'dart:io';
import 'dart:math';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/products/product_detail_model.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_text_form_field.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/add_product_image_sub_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'dart:ui';
import 'package:path/path.dart' as path;

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

  final productNameTRController = TextEditingController();
  final productNameENController = TextEditingController();
  final productNameDEController = TextEditingController();
  final productDescriptionTRController = TextEditingController();
  final productDescriptionENController = TextEditingController();
  final productDescriptionGEController = TextEditingController();
  final productPriceController = TextEditingController();
  final productSummaryTRController = TextEditingController();
  final productSummaryENController = TextEditingController();
  final productSummaryGEController = TextEditingController();
  final categoriesController = TextEditingController();
  final brandController = TextEditingController();
  final countryController = TextEditingController();
  final statusController = TextEditingController();

  var categoryId;
  var subCategoryId;
  var deepCategoryId;
  var brandId;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  final ImagePicker imagePicker = ImagePicker();

  void selectImages() async {
    final List<XFile> pickedFiles = await imagePicker.pickMultiImage();

    final List<File> selectedImages =
        pickedFiles.map<File>((xfile) => File(xfile.path)).toList();

    if (selectedImages.isNotEmpty) {
      // ignore: use_build_context_synchronously
      Provider.of<MenuPageProvider>(context, listen: false)
          .updateSelectedImageFilesList(selectedImages);
    }
  }

  String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

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
    Provider.of<MenuPageProvider>(context, listen: false).countryList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).currencyList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).statusList.clear();

    Provider.of<MenuPageProvider>(context, listen: false).fetchCategoryList();

    Provider.of<MenuPageProvider>(context, listen: false).fetchBrandList();
    Provider.of<MenuPageProvider>(context, listen: false).fetchCountryList();
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
      productNameTRController.text =
          widget.passedObject!.productName.toString();
      productDescriptionTRController.text =
          widget.passedObject!.productDescription.toString();
      productPriceController.text = widget.passedObject!.price.toString();
      productSummaryTRController.text =
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
  void dispose() {
    Provider.of<MenuPageProvider>(context, listen: false)
        .subCategoryList
        .clear();
    Provider.of<MenuPageProvider>(context, listen: false)
        .deepCategoryList
        .clear();
    Provider.of<MenuPageProvider>(context, listen: false)
        .selectedFetureasList
        .clear();
    super.dispose();
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
    var countryList =
        Provider.of<MenuPageProvider>(context, listen: false).countryList;
    var currencyList =
        Provider.of<MenuPageProvider>(context, listen: true).currencyList;
    var statusList =
        Provider.of<MenuPageProvider>(context, listen: true).statusList;

    return Scaffold(
        backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black24,
        appBar: const CustomInnerAppBar(),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: Provider.of<ThemeProvider>(
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
                                // menuPageProvider.subCategoryList = [];
                                menuPageProvider.selectedSubCategory = null;
                                menuPageProvider.selectedDeepCategory = null;
                                menuPageProvider
                                    .updateVisibilitySubCategory(false);
                                menuPageProvider
                                    .updateVisibilityDeepCategory(false);

                                menuPageProvider
                                    .updateSelectedCategory(value as String);

                                var categoryIndex = categoryList.indexWhere(
                                    ((element) =>
                                        element.categoryName == value));
                                if (categoryIndex != -1) {
                                  debugPrint('CATEGORY INDEX: $categoryIndex');
                                  debugPrint(
                                      'CATEGORY ID: ${categoryList[categoryIndex].id}');

                                  categoryId = categoryList[categoryIndex].id;

                                  Provider.of<MenuPageProvider>(context,
                                          listen: false)
                                      .fetchSubCategoryList(
                                          parentId: categoryId);

                                  menuPageProvider
                                      .updateVisibilitySubCategory(true);
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

                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
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
                                padding:
                                    const EdgeInsets.fromLTRB(16, 16, 16, 4),
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
                                        color:
                                            Provider.of<ThemeProvider>(context)
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
                          Visibility(
                            visible:
                                menuPageProvider.subCategoryList.isNotEmpty &&
                                    menuPageProvider.visibilitySubCategory,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 13,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      'Sub Categories'.tr,
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
                                    items: menuPageProvider.subCategoryList
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
                                    value: menuPageProvider.selectedSubCategory,

                                    onChanged: (value) {
                                      menuPageProvider.selectedDeepCategory =
                                          null;
                                      menuPageProvider
                                          .updateVisibilityDeepCategory(false);
                                      menuPageProvider
                                          .updateSelectedSubCategory(
                                              value as String);

                                      var subCategoryIndex = menuPageProvider
                                          .subCategoryList
                                          .indexWhere(((element) =>
                                              element.categoryName == value));
                                      if (subCategoryIndex != -1) {
                                        debugPrint(
                                            'CATEGORY INDEX: $subCategoryIndex');
                                        debugPrint(
                                            'CATEGORY ID: ${menuPageProvider.subCategoryList[subCategoryIndex].id}');

                                        subCategoryId = menuPageProvider
                                            .subCategoryList[subCategoryIndex]
                                            .id;

                                        Provider.of<MenuPageProvider>(context,
                                                listen: false)
                                            .fetchDeepCategoryList(
                                                parentId: subCategoryId!);
                                        menuPageProvider
                                            .updateVisibilityDeepCategory(true);
                                      }
                                    },

                                    icon: Center(
                                      child: Image.asset(
                                        'assets/icons/dropdown.png',
                                        width: 10,
                                        height: 6,
                                        color:
                                            Provider.of<ThemeProvider>(context)
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
                                          color: Provider.of<ThemeProvider>(
                                                          context)
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
                          ),
                          Visibility(
                            visible:
                                menuPageProvider.deepCategoryList.isNotEmpty &&
                                    menuPageProvider.visibilityDeepCategory,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 13,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      'Deep Categories'.tr,
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
                                    isExpanded: true,
                                    items: menuPageProvider.deepCategoryList
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
                                    value:
                                        menuPageProvider.selectedDeepCategory,
                                    onChanged: (value) {
                                      menuPageProvider
                                          .updateSelectedDeepCategory(
                                              value as String);

                                      var deepCategoryIndex = menuPageProvider
                                          .deepCategoryList
                                          .indexWhere(((element) =>
                                              element.categoryName == value));

                                      if (deepCategoryIndex != -1) {
                                        debugPrint(
                                            'CATEGORY INDEX: $deepCategoryIndex');
                                        debugPrint(
                                            'CATEGORY ID: ${menuPageProvider.deepCategoryList[deepCategoryIndex].id}');

                                        deepCategoryId = menuPageProvider
                                            .deepCategoryList[deepCategoryIndex]
                                            .id;
                                        menuPageProvider
                                            .fetchCategoryFeatureasList(
                                                categoryId: deepCategoryId!);

                                        menuPageProvider
                                            .updateVisibilityCategoryFeatureas(
                                                true);
                                      }
                                    },

                                    icon: Center(
                                      child: Image.asset(
                                        'assets/icons/dropdown.png',
                                        width: 10,
                                        height: 6,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue3
                                                : AppTheme.white15,
                                      ),
                                    ),
                                    iconSize: 24,
                                    buttonHeight: 57,
                                    buttonWidth: deviceWidth,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 25, right: 17),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Provider.of<ThemeProvider>(context)
                                                  .themeMode ==
                                              "light"
                                          ? AppTheme.white39
                                          : AppTheme.black18,
                                    ),

                                    itemHeight: 40,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    dropdownMaxHeight: 350,
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

                                    searchInnerWidget: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 16, 16, 4),
                                      child: TextFormField(
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w500,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
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
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Visibility(
                              visible: menuPageProvider
                                      .categoryFeatureasList.isNotEmpty &&
                                  menuPageProvider
                                      .visibilitycategoryFeatureasList,
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: menuPageProvider
                                      .categoryFeatureasList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var featureas = menuPageProvider
                                        .categoryFeatureasList[index].feature;

                                    return featureas!.values!.isNotEmpty
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: Text(
                                                    featureas.label ?? '',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: AppTheme
                                                          .appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: themeMode
                                                          ? AppTheme.blue3
                                                          : AppTheme.white14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                constraints:
                                                    const BoxConstraints(
                                                        minWidth:
                                                            double.infinity,
                                                        maxHeight: 250),
                                                decoration: BoxDecoration(
                                                    color:
                                                        Provider.of<ThemeProvider>(
                                                                        context)
                                                                    .themeMode ==
                                                                "light"
                                                            ? AppTheme.white39
                                                            : AppTheme.black18,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 13.0),
                                                child: Scrollbar(
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      padding: EdgeInsets.zero,
                                                      itemCount: featureas
                                                          .values!.length,
                                                      itemBuilder:
                                                          ((context, index) {
                                                        var feature = featureas
                                                            .values![index];
                                                        var isSelected =
                                                            menuPageProvider
                                                                .selectedFetureasList
                                                                .contains(
                                                                    feature);
                                                        return feature != null
                                                            ? Container(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        16.0),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    menuPageProvider.updateSelectedFetureas(
                                                                        selectedFetureasModel:
                                                                            feature,
                                                                        isSelected:
                                                                            !isSelected);
                                                                  },
                                                                  child: Row(
                                                                    children: [
                                                                      if (isSelected)
                                                                        const Icon(Icons
                                                                            .check_box_outlined)
                                                                      else
                                                                        const Icon(
                                                                            Icons.check_box_outline_blank),
                                                                      const SizedBox(
                                                                          width:
                                                                              16),
                                                                      Text(
                                                                        feature
                                                                            .displayedValue!,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            : const SizedBox();
                                                      })),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 13,
                                              ),
                                            ],
                                          )
                                        : const SizedBox();
                                  })),
                          menuPageProvider.isSelectedProductNameIndex == 1
                              ? CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Product Name Validate'.tr;
                                    }
                                    return null;
                                  },
                                  controller: productNameTRController,
                                  titleText: 'Product Name'.tr,
                                )
                              : menuPageProvider.isSelectedProductNameIndex == 2
                                  ? CustomTextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Product Name Validate'.tr;
                                        }
                                        return null;
                                      },
                                      controller: productNameENController,
                                      titleText: 'Product Name'.tr,
                                    )
                                  : CustomTextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Product Name Validate'.tr;
                                        }
                                        return null;
                                      },
                                      controller: productNameDEController,
                                      titleText: 'Product Name'.tr,
                                    ),
                          Row(
                            children: [
                              _choiceChipProductName('Turkish'.tr, 1),
                              const SizedBox(width: 10.0),
                              _choiceChipProductName(
                                'English'.tr,
                                2,
                              ),
                              const SizedBox(width: 10.0),
                              _choiceChipProductName(
                                'German'.tr,
                                3,
                              ),
                            ],
                          ),
                          const SizedBox(height: 13),
                          menuPageProvider.isSelectedProductDescriptionIndex ==
                                  1
                              ? CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Product Description Validate'.tr;
                                    }
                                    return null;
                                  },
                                  controller: productDescriptionTRController,
                                  titleText: 'Product Description'.tr,
                                  minLines: 2,
                                  maxLines: 5,
                                )
                              : menuPageProvider
                                          .isSelectedProductDescriptionIndex ==
                                      2
                                  ? CustomTextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Product Description Validate'
                                              .tr;
                                        }
                                        return null;
                                      },
                                      controller:
                                          productDescriptionENController,
                                      titleText: 'Product Description'.tr,
                                      minLines: 2,
                                      maxLines: 5,
                                    )
                                  : CustomTextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Product Description Validate'
                                              .tr;
                                        }
                                        return null;
                                      },
                                      controller:
                                          productDescriptionGEController,
                                      titleText: 'Product Description'.tr,
                                      minLines: 2,
                                      maxLines: 5,
                                    ),
                          Row(
                            children: [
                              _choiceChipProductDescription(
                                'Turkish'.tr,
                                1,
                              ),
                              const SizedBox(width: 10.0),
                              _choiceChipProductDescription(
                                'English'.tr,
                                2,
                              ),
                              const SizedBox(width: 10.0),
                              _choiceChipProductDescription(
                                'German'.tr,
                                3,
                              ),
                            ],
                          ),
                          const SizedBox(height: 13),
                          CustomTextFormField(
                            controller: productPriceController,
                            titleText: 'Width'.tr,
                            keyboardType: TextInputType.number,
                            suffixText: 'sm',
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          CustomTextFormField(
                            controller: productPriceController,
                            titleText: 'Height'.tr,
                            suffixText: 'cm',
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          CustomTextFormField(
                            controller: productPriceController,
                            titleText: 'Weight'.tr,
                            suffixText: 'gr',
                            keyboardType: TextInputType.number,
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
                            titleText: 'Length'.tr,
                            suffixText: 'cm',
                            keyboardType: TextInputType.number,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fiyatlandırma'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w400,
                                  color: themeMode
                                      ? AppTheme.blue3
                                      : AppTheme.white14,
                                ),
                              ),
                              const SizedBox(height: 13.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        8, 16, 16, 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: themeMode
                                          ? AppTheme.white39
                                          : AppTheme.black18,
                                    ),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            menuPageProvider
                                                .updateSelectedRetailSale(
                                                    !(menuPageProvider
                                                        .selectedRetailSale));
                                            menuPageProvider
                                                .updateSelectedWholeSale(false);
                                          },
                                          child: Row(
                                            children: [
                                              if (menuPageProvider
                                                  .selectedRetailSale)
                                                const Icon(
                                                    Icons.check_box_outlined)
                                              else
                                                const Icon(Icons
                                                    .check_box_outline_blank),
                                              const SizedBox(width: 16),
                                            ],
                                          ),
                                        ),
                                        const Text('Perakende Satış'),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        8, 16, 16, 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: themeMode
                                          ? AppTheme.white39
                                          : AppTheme.black18,
                                    ),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            menuPageProvider
                                                .updateSelectedWholeSale(
                                                    !(menuPageProvider
                                                        .selectedWholeSale));
                                            menuPageProvider
                                                .updateSelectedRetailSale(
                                                    false);
                                          },
                                          child: Row(
                                            children: [
                                              if (menuPageProvider
                                                  .selectedWholeSale)
                                                const Icon(
                                                    Icons.check_box_outlined)
                                              else
                                                const Icon(Icons
                                                    .check_box_outline_blank),
                                              const SizedBox(width: 16),
                                            ],
                                          ),
                                        ),
                                        const Text('Toptan Satış'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 13.0),
                              (menuPageProvider.selectedRetailSale ||
                                      menuPageProvider.selectedWholeSale)
                                  ? Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              'Country'.tr,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
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
                                            isExpanded: true,

                                            items: countryList
                                                .map((item) =>
                                                    DropdownMenuItem<String?>(
                                                      value: item.name,
                                                      child: Text(
                                                        item.name ?? '',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? AppTheme.blue3
                                                              : AppTheme.white1,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            value:
                                                Provider.of<MenuPageProvider>(
                                                        context)
                                                    .selectedCountry,

                                            onChanged: (value) {
                                              Provider.of<MenuPageProvider>(
                                                      context,
                                                      listen: false)
                                                  .updateSelectedCountry(
                                                      value as String);
                                            },

                                            icon: Center(
                                              child: Image.asset(
                                                'assets/icons/dropdown.png',
                                                width: 10,
                                                height: 6,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
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
                                                const EdgeInsets.only(
                                                    left: 25, right: 17),
                                            buttonDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              // border:
                                              //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),

                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.white39
                                                  : AppTheme.black18,
                                            ),
                                            // buttonElevation: 2,
                                            itemHeight: 40,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 32),
                                            // dropdownMaxHeight: deviceHeight * 0.4,
                                            dropdownMaxHeight: 350,
                                            // dropdownWidth: deviceWidth,
                                            dropdownPadding: null,
                                            dropdownDecoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.white39
                                                  : AppTheme.black18,
                                            ),
                                            // dropdownElevation: 8,
                                            scrollbarRadius:
                                                const Radius.circular(40),
                                            scrollbarThickness: 4,
                                            scrollbarAlwaysShow: true,
                                            // offset: const Offset(0, 180),

                                            searchController: countryController,
                                            searchInnerWidget: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      16, 16, 16, 4),
                                              child: TextFormField(
                                                controller: countryController,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Provider.of<ThemeProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              "light"
                                                          ? AppTheme.blue3
                                                          : AppTheme.white1,
                                                ), // WHILE WRITING
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                    horizontal: 16,
                                                    vertical: 12,
                                                  ),
                                                  hintText: 'Search...'.tr,
                                                  hintStyle: TextStyle(
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
                                                            : AppTheme.white14,
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                        color: AppTheme.white15,
                                                        width: 1,
                                                      )),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide:
                                                              BorderSide(
                                                            color: AppTheme
                                                                .white15,
                                                            width: 1,
                                                          )),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
                                                  .contains(searchValue
                                                      .toLowerCase()));
                                            },
                                            //This to clear the search value when you close the menu
                                            onMenuStateChange: (isOpen) {
                                              if (!isOpen) {
                                                countryController.clear();
                                              }
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: 13),
                                        (!menuPageProvider.selectedRetailSale &&
                                                menuPageProvider
                                                    .selectedWholeSale)
                                            ? Column(
                                                children: [
                                                  CustomTextFormField(
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value
                                                              .trim()
                                                              .isEmpty) {
                                                        return 'Price Validate'
                                                            .tr;
                                                      }
                                                      return null;
                                                    },
                                                    controller:
                                                        productPriceController,
                                                    titleText: 'Quantity'.tr,
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                                  const SizedBox(height: 13),
                                                ],
                                              )
                                            : const SizedBox(),
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                child: Text(
                                                  'Currency'.tr,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        AppTheme.appFontFamily,
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
                                                    .map((item) =>
                                                        DropdownMenuItem<
                                                            String>(
                                                          value: item,
                                                          child: Text(
                                                            item,
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily: AppTheme
                                                                  .appFontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Provider.of<ThemeProvider>(
                                                                              context)
                                                                          .themeMode ==
                                                                      "light"
                                                                  ? AppTheme
                                                                      .blue3
                                                                  : AppTheme
                                                                      .white1,
                                                            ),
                                                          ),
                                                        ))
                                                    .toList(),
                                                value: menuPageProvider
                                                    .selectedCurrency,
                                                onChanged: (value) {
                                                  menuPageProvider
                                                      .updateSelectedCurrency(
                                                          value as String);
                                                },
                                                icon: Center(
                                                  child: Image.asset(
                                                    'assets/icons/dropdown.png',
                                                    width: 10,
                                                    height: 6,
                                                    color:
                                                        Provider.of<ThemeProvider>(
                                                                        context)
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
                                                    const EdgeInsets.only(
                                                        left: 25, right: 17),
                                                buttonDecoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  // border:
                                                  //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),

                                                  color:
                                                      Provider.of<ThemeProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              "light"
                                                          ? AppTheme.white39
                                                          : AppTheme.black18,
                                                ),
                                                // buttonElevation: 2,
                                                itemHeight: 40,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 32),
                                                // dropdownMaxHeight: deviceHeight * 0.4,
                                                dropdownMaxHeight: 350,
                                                // dropdownWidth: deviceWidth,
                                                dropdownPadding: null,
                                                dropdownDecoration:
                                                    BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  color:
                                                      Provider.of<ThemeProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              "light"
                                                          ? AppTheme.white39
                                                          : AppTheme.black18,
                                                ),
                                                // dropdownElevation: 8,
                                                scrollbarRadius:
                                                    const Radius.circular(40),
                                                scrollbarThickness: 4,
                                                scrollbarAlwaysShow: true,
                                                // offset: const Offset(0, 180),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 13),
                                        CustomTextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty) {
                                              return 'Price Validate'.tr;
                                            }
                                            return null;
                                          },
                                          controller: productPriceController,
                                          titleText: 'Price'.tr,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          const SizedBox(height: 13),
                          menuPageProvider.isSelectedProductSummaryIndex == 1
                              ? CustomTextFormField(
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Product Summary Validate'.tr;
                                    }
                                    return null;
                                  },
                                  controller: productSummaryTRController,
                                  titleText: 'Product Summary'.tr,
                                  keyboardType: TextInputType.text,
                                  minLines: 2,
                                  maxLines: 5,
                                )
                              : menuPageProvider
                                          .isSelectedProductSummaryIndex ==
                                      2
                                  ? CustomTextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Product Summary Validate'.tr;
                                        }
                                        return null;
                                      },
                                      controller: productSummaryENController,
                                      titleText: 'Product Summary'.tr,
                                      keyboardType: TextInputType.text,
                                      minLines: 2,
                                      maxLines: 5,
                                    )
                                  : CustomTextFormField(
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return 'Product Summary Validate'.tr;
                                        }
                                        return null;
                                      },
                                      controller: productSummaryGEController,
                                      titleText: 'Product Summary'.tr,
                                      keyboardType: TextInputType.text,
                                      minLines: 2,
                                      maxLines: 5,
                                    ),
                          Row(
                            children: [
                              _choiceChipProductSummary(
                                'Turkish'.tr,
                                1,
                              ),
                              const SizedBox(width: 10.0),
                              _choiceChipProductSummary(
                                'English'.tr,
                                2,
                              ),
                              const SizedBox(width: 10.0),
                              _choiceChipProductSummary(
                                'German'.tr,
                                3,
                              ),
                            ],
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
                          const SizedBox(
                            height: 13.0,
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 27),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Add Product Image'.tr,
                                    style: TextStyle(
                                      fontFamily: AppTheme.appFontFamily,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                  const SizedBox(height: 13),
                                  MaterialButton(
                                      minWidth: deviceWidth,
                                      height: 52,
                                      elevation: 0,
                                      color: AppTheme.blue2,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          56, 43, 56, 38),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Add Product Image Info-1'.tr,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: AppTheme.white1),
                                          ),
                                          const SizedBox(height: 28),
                                          Image.asset(
                                            "assets/icons/mdi_cloud-upload-outline.png",
                                            width: 116,
                                            height: 116,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(height: 28),
                                          Text(
                                            'Add Product Image Info-2'.tr,
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: AppTheme.white1),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        selectImages();
                                      }),
                                  const SizedBox(height: 21),
                                  Visibility(
                                    visible: menuPageProvider
                                        .imageFilesList!.isNotEmpty,
                                    child: ListView.separated(
                                      controller: scrollController,
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.all(0),
                                      itemCount: menuPageProvider
                                          .imageFilesList!.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(height: 11);
                                      },
                                      itemBuilder: ((context, index) {
                                        var image = menuPageProvider
                                            .imageFilesList![index];

                                        String imageName = path
                                            .basename(image.path)
                                            .substring(12);

                                        final file = File(image.path);
                                        String imageSize =
                                            formatBytes(file.lengthSync(), 2);

                                        return Container(
                                          width: deviceWidth,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              width: 1,
                                              color: themeMode
                                                  ? AppTheme.white10
                                                  : AppTheme.black28,
                                            ),
                                            color: themeMode
                                                ? AppTheme.white5
                                                : Colors.transparent,
                                          ),
                                          padding: const EdgeInsets.fromLTRB(
                                              12, 12, 12, 12),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 60,
                                                height: 60,
                                                color: AppTheme.white10,
                                                child: Center(
                                                  child: Image.file(
                                                    File(image.path),
                                                    width: 59,
                                                    height: 59,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                    child: SizedBox(
                                                      width: deviceWidth * .5,
                                                      child: Text(
                                                        imageName,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: themeMode
                                                              ? AppTheme.blue3
                                                              : AppTheme.white1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    imageSize,
                                                    style: TextStyle(
                                                      fontFamily: AppTheme
                                                          .appFontFamily,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppTheme.white15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              IconButton(
                                                splashRadius: 24,
                                                icon: Image.asset(
                                                  'assets/icons/tabler_trash.png',
                                                  width: 24,
                                                  height: 24,
                                                  color: themeMode
                                                      ? AppTheme.blue2
                                                      : AppTheme.white15,
                                                ),
                                                onPressed: () {
                                                  menuPageProvider
                                                      .deleteSelectedImage(
                                                          image);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
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
                                    ? 'Add'.tr
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
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                AddProductImageSubPage(
                                                    accountId: '',
                                                    categoryId: categoryId,
                                                    subCategoryId:
                                                        subCategoryId,
                                                    deepCategoryId:
                                                        deepCategoryId,
                                                    categoryFeatures: menuPageProvider
                                                        .selectedFetureasList,
                                                    productName:
                                                        productNameTRController
                                                            .text,
                                                    productDescription:
                                                        productDescriptionTRController
                                                            .text,
                                                    productSummary:
                                                        productSummaryTRController
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
                                              categoryId: categoryId,
                                              productName:
                                                  productNameTRController.text,
                                              productDescription:
                                                  productDescriptionTRController
                                                      .text,
                                              productSummary:
                                                  productSummaryTRController
                                                      .text,
                                              brand: brandId,
                                              price:
                                                  productPriceController.text,
                                              currency: menuPageProvider
                                                  .selectedCurrency
                                                  .toString(),
                                              status: menuPageProvider
                                                          .selectedStatus ==
                                                      'Active'.tr
                                                  ? '1'
                                                  : '0')
                                          .then((value) {
                                        if (value == true) {
                                          debugPrint(
                                              "PRODUCT HAS SUCCESSFULLY UPDATED");

                                          Navigator.pop(context);
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

  Widget _choiceChipProductName(
    String title,
    int index,
  ) {
    return ChoiceChip(
      label: Text(title,
          style: Provider.of<MenuPageProvider>(context)
                      .isSelectedProductNameIndex ==
                  index
              ? const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600)
              : null),
      showCheckmark: true,
      checkmarkColor: AppTheme.green12,
      selectedColor: AppTheme.blue2,
      selected:
          Provider.of<MenuPageProvider>(context).isSelectedProductNameIndex ==
              index,
      onSelected: (value) {
        Provider.of<MenuPageProvider>(context, listen: false)
            .updateSelectedProductName(index);
        setState(() {});
      },
    );
  }

  Widget _choiceChipProductDescription(
    String title,
    int index,
  ) {
    return ChoiceChip(
      label: Text(title,
          style: Provider.of<MenuPageProvider>(context)
                      .isSelectedProductDescriptionIndex ==
                  index
              ? const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600)
              : null),
      showCheckmark: true,
      checkmarkColor: AppTheme.green12,
      selectedColor: AppTheme.blue2,
      selected: Provider.of<MenuPageProvider>(context)
              .isSelectedProductDescriptionIndex ==
          index,
      onSelected: (value) {
        Provider.of<MenuPageProvider>(context, listen: false)
            .updateSelectedProductDescription(index);
      },
    );
  }

  Widget _choiceChipProductSummary(
    String title,
    int index,
  ) {
    return ChoiceChip(
      label: Text(title,
          style: Provider.of<MenuPageProvider>(context)
                      .isSelectedProductSummaryIndex ==
                  index
              ? const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600)
              : null),
      showCheckmark: true,
      checkmarkColor: AppTheme.green12,
      selectedColor: AppTheme.blue2,
      selected: Provider.of<MenuPageProvider>(context)
              .isSelectedProductSummaryIndex ==
          index,
      onSelected: (value) {
        Provider.of<MenuPageProvider>(context, listen: false)
            .updateSelectedProductSummary(index);
      },
    );
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
}
