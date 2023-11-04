// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: iterable_contains_unrelated_type
import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/categories/category_featureas_model.dart';
import 'package:b2geta_mobile/models/products/product_detail_edit_model.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/model/retail_sale_model.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/model/whole_sale_model.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/product_added_sub_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/categories/category_model.dart';
import 'package:b2geta_mobile/models/general/brand_model.dart';
import 'package:b2geta_mobile/models/general/country_model.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_text_form_field.dart';

class AddProductSubPage extends StatefulWidget {
  const AddProductSubPage(
      {Key? key, this.passedObject, required this.operation})
      : super(key: key);

  final ProductDetailEditModel? passedObject;
  final String operation;

  @override
  State<AddProductSubPage> createState() => _AddProductSubPageState();
}

class _AddProductSubPageState extends State<AddProductSubPage> {
  ScrollController scrollController = ScrollController();
  GlobalKey<FormState> productGlobalKey = GlobalKey<FormState>();

  TextEditingController productNameTRController = TextEditingController();
  TextEditingController productNameENController = TextEditingController();
  TextEditingController productNameDEController = TextEditingController();
  TextEditingController productDescriptionTRController =
      TextEditingController();
  TextEditingController productDescriptionENController =
      TextEditingController();
  TextEditingController productDescriptionDEController =
      TextEditingController();
  TextEditingController productSummaryTRController = TextEditingController();
  TextEditingController productSummaryENController = TextEditingController();
  TextEditingController productSummaryDEController = TextEditingController();
  TextEditingController categoriesController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController gtipController = TextEditingController();

  var categoryId;
  var subCategoryId;
  var deepCategoryId;
  var brandId;
  List<File>? editImageList;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  final ImagePicker imagePicker = ImagePicker();

  void selectImages() async {
    final List<XFile> pickedFiles = await imagePicker.pickMultiImage();

    final List<File> selectedImages =
        pickedFiles.map<File>((xFile) => File(xFile.path)).toList();

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

  void clear() {
    Provider.of<MenuPageProvider>(context, listen: false).categoryList.clear();
    Provider.of<MenuPageProvider>(context, listen: false)
        .subCategoryList
        .clear();
    Provider.of<MenuPageProvider>(context, listen: false)
        .deepCategoryList
        .clear();
    Provider.of<MenuPageProvider>(context, listen: false)
        .categoryFeatureasList
        .clear();
    Provider.of<MenuPageProvider>(context, listen: false).selectedCategory =
        null;
    Provider.of<MenuPageProvider>(context, listen: false).selectedSubCategory =
        null;
    Provider.of<MenuPageProvider>(context, listen: false).selectedDeepCategory =
        null;
    Provider.of<MenuPageProvider>(context, listen: false)
        .selectedFetureasList
        .clear();
    Provider.of<MenuPageProvider>(context, listen: false)
        .visibilitySubCategory = false;
    Provider.of<MenuPageProvider>(context, listen: false)
        .visibilityDeepCategory = false;
    Provider.of<MenuPageProvider>(context, listen: false)
        .visibilitycategoryFeatureasList = false;
    Provider.of<MenuPageProvider>(context, listen: false).brandList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).selectedBrand = null;
    Provider.of<MenuPageProvider>(context, listen: false).statusList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).selectedStatus = null;
    Provider.of<MenuPageProvider>(context, listen: false).currencyList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).selectedCurrency =
        null;
    Provider.of<MenuPageProvider>(context, listen: false).imageFilesList = [];

    Provider.of<MenuPageProvider>(context, listen: false).selectedCategory =
        null;
    Provider.of<MenuPageProvider>(context, listen: false).selectedBrand = null;
    Provider.of<MenuPageProvider>(context, listen: false).selectedCurrency =
        null;
    Provider.of<MenuPageProvider>(context, listen: false).selectedStatus = null;
    Provider.of<MenuPageProvider>(context, listen: false).categoryList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).brandList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).statusList.clear();
    Provider.of<MenuPageProvider>(context, listen: false)
        .retailSaleList
        .clear();
    Provider.of<MenuPageProvider>(context, listen: false).wholeSaleList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).selectedRetailSale =
        false;
    Provider.of<MenuPageProvider>(context, listen: false).selectedWholeSale =
        false;
  }

  @override
  void initState() {
    super.initState();

    clear();

    Provider.of<MenuPageProvider>(context, listen: false).currencyList = [
      'EUR',
      'TRY',
      'USD',
    ];
    Provider.of<MenuPageProvider>(context, listen: false).statusList = [
      'Active'.tr,
      'Passive'.tr
    ];

    if (widget.operation == 'Add') {
      var country = Constants.language == 'tr' ? 'Turkey' : null;
      var currency = Constants.language == 'tr' ? 'TRY' : null;
      var countryCode = Constants.language == 'tr' ? 'TR' : null;
      TextEditingController priceController = TextEditingController();

      RetailSaleModel retailSaleModel = RetailSaleModel(
          country: country,
          currency: currency,
          priceController: priceController,
          quantity: '1',
          countryCode: countryCode,
          type: 'retail');

      Provider.of<MenuPageProvider>(context, listen: false)
          .updateRetailSaleList(retailSaleModel: retailSaleModel);
      Provider.of<MenuPageProvider>(context, listen: false)
          .updateSelectedRetailSale(true);
    }

    Provider.of<MenuPageProvider>(context, listen: false).fetchCategoryList();
    Provider.of<MenuPageProvider>(context, listen: false).fetchBrandList();

    if (widget.operation == 'Edit' && widget.passedObject != null) {
      productNameTRController.text = widget.passedObject!.productName!.tr ?? '';
      productNameENController.text = widget.passedObject!.productName!.en ?? '';
      productNameDEController.text = widget.passedObject!.productName!.de ?? '';
      productDescriptionTRController.text =
          widget.passedObject!.productDescription!.tr ?? '';
      productDescriptionENController.text =
          widget.passedObject!.productDescription!.en ?? '';
      productDescriptionDEController.text =
          widget.passedObject!.productDescription!.de ?? '';
      productSummaryTRController.text =
          widget.passedObject!.productSummary!.tr ?? '';
      productSummaryENController.text =
          widget.passedObject!.productSummary!.en ?? '';
      productSummaryDEController.text =
          widget.passedObject!.productSummary!.de ?? '';
      widthController.text = widget.passedObject!.width != null
          ? widget.passedObject!.width.toString()
          : '';
      heightController.text = widget.passedObject!.height != null
          ? widget.passedObject!.height.toString()
          : '';
      weightController.text = widget.passedObject!.weight != null
          ? widget.passedObject!.weight.toString()
          : '';
      lengthController.text = widget.passedObject!.length != null
          ? widget.passedObject!.length.toString()
          : '';

      categoryId = widget.passedObject!.categories![0].categoryId;
      subCategoryId = widget.passedObject!.categories![1].categoryId;
      deepCategoryId = widget.passedObject!.categories![2].categoryId;

      Provider.of<MenuPageProvider>(context, listen: false).fetchCategoryList();

      Provider.of<MenuPageProvider>(context, listen: false)
          .fetchSubCategoryList(parentId: categoryId);

      Provider.of<MenuPageProvider>(context, listen: false)
          .fetchDeepCategoryList(parentId: subCategoryId);

      Provider.of<MenuPageProvider>(context, listen: false)
          .updateVisibilitySubCategory(true);

      Provider.of<MenuPageProvider>(context, listen: false)
          .updateVisibilityDeepCategory(true);

      Provider.of<MenuPageProvider>(context, listen: false).selectedCategory =
          widget.passedObject!.categories![0].categoryName;

      Provider.of<MenuPageProvider>(context, listen: false)
              .selectedSubCategory =
          widget.passedObject!.categories![1].categoryName;

      Provider.of<MenuPageProvider>(context, listen: false)
              .selectedDeepCategory =
          widget.passedObject!.categories![2].categoryName;

      Provider.of<MenuPageProvider>(context, listen: false)
          .fetchCategoryFeatureasList(categoryId: deepCategoryId);

      if (widget.passedObject!.features != null &&
          widget.passedObject!.features!.isNotEmpty) {
        for (var e in widget.passedObject!.features!.values) {
          for (var element in e.values!.entries) {
            Provider.of<MenuPageProvider>(context, listen: false)
                .updateSelectedFetureas(
                    selectedFetureasModel: CategoryFeatureasModelFeatureValues(
                        attributeId: e.id,
                        id: element.key,
                        displayedValue: element.value),
                    isSelected: true);
          }
        }
        Provider.of<MenuPageProvider>(context, listen: false)
            .updateVisibilityCategoryFeatureas(true);
      }

      brandId = widget.passedObject!.brand!.id;
      Provider.of<MenuPageProvider>(context, listen: false).selectedBrand =
          widget.passedObject!.brand!.name;

      Provider.of<MenuPageProvider>(context, listen: false).selectedCurrency =
          widget.passedObject!.currency;

      Provider.of<MenuPageProvider>(context, listen: false).selectedStatus =
          widget.passedObject!.status == '1' ? 'Active'.tr : 'Passive'.tr;

      var countryList =
          Provider.of<MenuPageProvider>(context, listen: false).countryList;

      for (var element in widget.passedObject!.prices!) {
        if (element.type == 'retail') {
          Provider.of<MenuPageProvider>(context, listen: false)
              .updateSelectedRetailSale((true));

          var countryCode = element.country;
          var currency = element.currency;

          String? country;

          for (var element in countryList) {
            if (element.code == countryCode) {
              country = element.name;
            }
          }

          TextEditingController priceController = TextEditingController();
          priceController.text = element.price.toString();
          RetailSaleModel retailSaleModel = RetailSaleModel(
              country: country,
              currency: currency,
              priceController: priceController,
              quantity: '1',
              countryCode: countryCode,
              type: 'retail');

          Provider.of<MenuPageProvider>(context, listen: false)
              .updateRetailSaleList(retailSaleModel: retailSaleModel);
        } else if (element.type == 'wholesale') {
          Provider.of<MenuPageProvider>(context, listen: false)
              .updateSelectedWholeSale(true);

          var countryCode = element.country;
          var currency = element.currency;

          String? country;

          for (var element in countryList) {
            if (element.code == countryCode) {
              country = element.name;
            }
          }

          TextEditingController priceController = TextEditingController();
          TextEditingController quantityController = TextEditingController();
          quantityController.text = element.quantity.toString();
          priceController.text = element.price.toString();

          WholeSaleModel wholeSaleModel = WholeSaleModel(
              country: country,
              currency: currency,
              priceController: priceController,
              countryCode: countryCode,
              quantityController: quantityController,
              type: 'wholesale');

          Provider.of<MenuPageProvider>(context, listen: false)
              .updateWholeSaleList(wholeSaleModel: wholeSaleModel);
        }
      }

      gtipController.text = widget.passedObject!.gtip ?? '';

      if (widget.passedObject!.images != null) {
        editImageList =
            widget.passedObject!.images!.map((e) => File(e)).toList();
      }

      Provider.of<MenuPageProvider>(context, listen: false)
          .updateSelectedBrand(widget.passedObject!.brand!.name!);
    }
  }

  @override
  void dispose() {
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
                          _categories(categoryList, context, menuPageProvider),
                          _subCategories(menuPageProvider, context),
                          _deepCategories(menuPageProvider, context),
                          const SizedBox(height: 13),
                          _categoryFeatures(menuPageProvider),
                          _productName(menuPageProvider),
                          const SizedBox(height: 13),
                          _productDescription(menuPageProvider),
                          const SizedBox(height: 13),
                          _sizes(),
                          const SizedBox(height: 13),
                          _brand(brandList, context, menuPageProvider),
                          const SizedBox(height: 13),
                          _pricing(menuPageProvider, countryList, currencyList),
                          const SizedBox(height: 13),
                          _productSummary(menuPageProvider),
                          const SizedBox(height: 13),
                          _status(statusList, context, menuPageProvider),
                          const SizedBox(height: 13.0),
                          _addImages(menuPageProvider),
                          const SizedBox(height: 13.0),
                          _gtip(),
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
                                  if (categoryId != null &&
                                      subCategoryId != null &&
                                      deepCategoryId != null &&
                                      menuPageProvider.selectedStatus != null) {
                                    List<String> categoriesList = [
                                      categoryId,
                                      subCategoryId,
                                      deepCategoryId
                                    ];
                                    if (((menuPageProvider
                                            .retailSaleList.isNotEmpty) |
                                        menuPageProvider
                                            .wholeSaleList.isNotEmpty)) {
                                      if (widget.operation == 'Add') {
                                        if (menuPageProvider.imageFilesList !=
                                                null &&
                                            menuPageProvider
                                                .imageFilesList!.isNotEmpty) {
                                          locator<ProductsServices>()
                                              .addProductCall(
                                                  accountId: Provider.of<UserProvider>(context, listen: false).getUser.id ??
                                                      '',
                                                  brandId: brandId,
                                                  brandName: menuPageProvider.selectedBrand ??
                                                      '',
                                                  categoriesList:
                                                      categoriesList,
                                                  productNameTR: productNameTRController
                                                      .text,
                                                  productNameEN: productNameENController
                                                      .text,
                                                  productNameDE:
                                                      productNameDEController
                                                          .text,
                                                  productDescriptionTR:
                                                      productDescriptionTRController
                                                          .text,
                                                  productDescriptionEN:
                                                      productDescriptionENController
                                                          .text,
                                                  productDescriptionDE:
                                                      productDescriptionDEController
                                                          .text,
                                                  productSummaryTR:
                                                      productSummaryTRController
                                                          .text,
                                                  productSummaryEN:
                                                      productSummaryENController
                                                          .text,
                                                  productSummaryDE:
                                                      productSummaryDEController
                                                          .text,
                                                  width: widthController.text,
                                                  height: heightController.text,
                                                  weight: weightController.text,
                                                  length: lengthController.text,
                                                  saleRetail: menuPageProvider
                                                          .retailSaleList
                                                          .isNotEmpty
                                                      ? '1'
                                                      : '0',
                                                  saleWhole: menuPageProvider
                                                          .wholeSaleList
                                                          .isNotEmpty
                                                      ? '1'
                                                      : '0',
                                                  status: menuPageProvider.selectedStatus == 'Active'.tr ? '1' : '0',
                                                  images: menuPageProvider.imageFilesList ?? [],
                                                  categoryFeatures: menuPageProvider.selectedFetureasList,
                                                  retailSaleList: menuPageProvider.retailSaleList,
                                                  wholeSaleList: menuPageProvider.wholeSaleList,
                                                  gtip: gtipController.text)
                                              .then((value) {
                                            if (value == true) {
                                              debugPrint(
                                                  "PRODUCT HAS SUCCESSFULLY ADDED");

                                              menuPageProvider
                                                  .clearSelectedImageFilesList();

                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (_, __, ___) =>
                                                      const ProductAddedSubPage(),
                                                  transitionDuration:
                                                      const Duration(
                                                          milliseconds: 0),
                                                  reverseTransitionDuration:
                                                      const Duration(
                                                          milliseconds: 0),
                                                  transitionsBuilder:
                                                      (_, a, __, c) =>
                                                          FadeTransition(
                                                              opacity: a,
                                                              child: c),
                                                ),
                                                (route) => true,
                                              );
                                            } else {
                                              debugPrint(
                                                  "PRODUCT HAS NOT ADDED");
                                              operationFailedDialog(context);
                                            }
                                          });
                                        } else {
                                          validationErrorDialog(
                                            context,
                                          );
                                        }
                                      } else if (widget.operation == 'Edit') {
                                        List<String> categoriesList = [
                                          categoryId,
                                          subCategoryId,
                                          deepCategoryId
                                        ];
                                        if (menuPageProvider.imageFilesList !=
                                                null &&
                                            menuPageProvider
                                                .imageFilesList!.isNotEmpty) {
                                          locator<ProductsServices>()
                                              .updateProductImageCall(
                                                  accountId: widget
                                                          .passedObject!
                                                          .accountId ??
                                                      '',
                                                  productId:
                                                      widget.passedObject!.id ??
                                                          '',
                                                  images: menuPageProvider
                                                      .imageFilesList!);
                                        }
                                        locator<ProductsServices>()
                                            .updateProductCall(
                                                productId: widget.passedObject!.id ??
                                                    '',
                                                brandId: brandId,
                                                brandName: menuPageProvider.selectedBrand ??
                                                    '',
                                                categoriesList: categoriesList,
                                                productNameTR: productNameTRController
                                                    .text,
                                                productNameEN: productNameENController
                                                    .text,
                                                productNameDE: productNameDEController
                                                    .text,
                                                productDescriptionTR:
                                                    productDescriptionTRController
                                                        .text,
                                                productDescriptionEN:
                                                    productDescriptionENController
                                                        .text,
                                                productDescriptionDE:
                                                    productDescriptionDEController
                                                        .text,
                                                productSummaryTR:
                                                    productSummaryTRController
                                                        .text,
                                                productSummaryEN:
                                                    productSummaryENController
                                                        .text,
                                                productSummaryDE:
                                                    productSummaryDEController
                                                        .text,
                                                width: widthController.text,
                                                height: heightController.text,
                                                weight: weightController.text,
                                                length: lengthController.text,
                                                saleRetail: menuPageProvider
                                                        .retailSaleList
                                                        .isNotEmpty
                                                    ? '1'
                                                    : '0',
                                                saleWhole: menuPageProvider
                                                        .wholeSaleList
                                                        .isNotEmpty
                                                    ? '1'
                                                    : '0',
                                                status: menuPageProvider.selectedStatus == 'Active'.tr
                                                    ? '1'
                                                    : '0',
                                                categoryFeatures:
                                                    menuPageProvider.selectedFetureasList,
                                                retailSaleList: menuPageProvider.retailSaleList,
                                                wholeSaleList: menuPageProvider.wholeSaleList,
                                                gtip: gtipController.text)
                                            .then((value) {
                                          if (value == true) {
                                            debugPrint(
                                                "PRODUCT HAS SUCCESSFULLY UPDATED");

                                            Navigator.pop(context);
                                          } else {
                                            debugPrint(
                                                "PRODUCT HAS NOT UPDATED");
                                            operationFailedDialog(context);
                                          }
                                        });
                                      }
                                    } else {
                                      validationErrorDialog(context,
                                          message: 'Price Error'.tr);
                                    }
                                  } else {
                                    debugPrint('burda');

                                    validationErrorDialog(
                                      context,
                                    );
                                  }
                                } else {
                                  validationErrorDialog(
                                    context,
                                  );
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

  CustomTextFormField _gtip() {
    return CustomTextFormField(
      titleText: 'GTIP'.tr,
      controller: gtipController,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'GTIP Validate'.tr;
        }
        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
      ],
    );
  }

  Column _pricing(MenuPageProvider menuPageProvider,
      List<CountryModel> countryList, List<String> currencyList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pricing'.tr,
          style: TextStyle(
            fontSize: 14,
            fontFamily: AppTheme.appFontFamily,
            fontWeight: FontWeight.w400,
            color: themeMode ? AppTheme.blue3 : AppTheme.white14,
          ),
        ),
        const SizedBox(height: 13.0),
        Container(
          padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: themeMode ? AppTheme.white39 : AppTheme.black18,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  if (menuPageProvider.selectedRetailSale == true) {
                    menuPageProvider.updateSelectedRetailSale(false);
                    menuPageProvider.retailSaleList.clear();
                  } else {
                    menuPageProvider.updateSelectedRetailSale((true));

                    if (menuPageProvider.retailSaleList.isEmpty) {
                      var country =
                          Constants.language == 'tr' ? 'Turkey' : null;
                      var currency = Constants.language == 'tr' ? 'TRY' : null;
                      var countryCode =
                          Constants.language == 'tr' ? 'TR' : null;
                      TextEditingController priceController =
                          TextEditingController();

                      RetailSaleModel retailSaleModel = RetailSaleModel(
                          country: country,
                          currency: currency,
                          priceController: priceController,
                          quantity: '1',
                          countryCode: countryCode,
                          type: 'retail');

                      menuPageProvider.updateRetailSaleList(
                          retailSaleModel: retailSaleModel);
                    }
                  }
                },
                child: Row(
                  children: [
                    if (menuPageProvider.selectedRetailSale)
                      const Icon(Icons.check_box_outlined)
                    else
                      const Icon(Icons.check_box_outline_blank),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              Text('Retail Sale'.tr),
            ],
          ),
        ),
        const SizedBox(height: 13.0),
        Visibility(
            visible: menuPageProvider.selectedRetailSale,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: menuPageProvider.retailSaleList.length,
              itemBuilder: (context, index) {
                return _getRetailSaleWidget(index, countryList, context,
                    currencyList, menuPageProvider);
              },
            )),
        Container(
          padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: themeMode ? AppTheme.white39 : AppTheme.black18,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  if (menuPageProvider.selectedWholeSale == true) {
                    menuPageProvider.updateSelectedWholeSale(false);
                    menuPageProvider.wholeSaleList.clear();
                  } else {
                    menuPageProvider.updateSelectedWholeSale((true));
                    if (menuPageProvider.wholeSaleList.isEmpty) {
                      var country =
                          Constants.language == 'tr' ? 'Turkey' : null;
                      var currency = Constants.language == 'tr' ? 'TRY' : null;
                      var countryCode =
                          Constants.language == 'tr' ? 'TR' : null;
                      TextEditingController priceController =
                          TextEditingController();
                      TextEditingController quantityController =
                          TextEditingController();

                      WholeSaleModel wholeSaleModel = WholeSaleModel(
                          country: country,
                          currency: currency,
                          priceController: priceController,
                          countryCode: countryCode,
                          quantityController: quantityController,
                          type: 'wholesale');

                      menuPageProvider.updateWholeSaleList(
                          wholeSaleModel: wholeSaleModel);
                    }
                  }
                },
                child: Row(
                  children: [
                    if (menuPageProvider.selectedWholeSale)
                      const Icon(Icons.check_box_outlined)
                    else
                      const Icon(Icons.check_box_outline_blank),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              Text('Whole Sale'.tr),
            ],
          ),
        ),
        Visibility(
            visible: menuPageProvider.selectedWholeSale,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menuPageProvider.wholeSaleList.length,
                itemBuilder: (context, index) {
                  return _getWholeSaleWidget(
                      menuPageProvider, countryList, currencyList, index);
                })),
      ],
    );
  }

  Widget _getWholeSaleWidget(MenuPageProvider menuPageProvider,
      List<CountryModel> countryList, List<String> currencyList, int index) {
    return Container(
      width: deviceWidth,
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            (index + 1).toString() + (".Fiyat").tr,
            style: TextStyle(
              fontSize: 14,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w400,
              color: themeMode ? AppTheme.blue3 : AppTheme.white14,
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Country'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: themeMode ? AppTheme.blue3 : AppTheme.white14,
                    ),
                  ),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField2(
                  isExpanded: true,
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  validator: (value) {
                    if (value == null) {
                      return 'Country Validate'.tr;
                    }
                    return null;
                  },
                  items: countryList
                      .map((item) => DropdownMenuItem<String?>(
                            value: item.name,
                            child: Text(
                              item.name ?? '',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ),
                            ),
                          ))
                      .toList(),
                  value: menuPageProvider.wholeSaleList[index].country,
                  onChanged: (value) {},
                  icon: Center(
                    child: Image.asset(
                      'assets/icons/dropdown.png',
                      width: 10,
                      height: 6,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white15,
                    ),
                  ),
                  iconSize: 24,
                  buttonHeight: 57,
                  buttonWidth: deviceWidth,
                  buttonPadding: const EdgeInsets.only(left: 25, right: 17),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
                  ),
                  // buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 32),
                  // dropdownMaxHeight: deviceHeight * 0.4,
                  dropdownMaxHeight: 350,
                  // dropdownWidth: deviceWidth,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
                  ),
                  // dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 4,
                  scrollbarAlwaysShow: true,
                  // offset: const Offset(0, 180),

                  searchInnerWidget: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
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
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
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
                                Provider.of<ThemeProvider>(context).themeMode ==
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
                    if (!isOpen) {}
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Quantity Validate'.tr;
              }
              return null;
            },
            controller:
                menuPageProvider.wholeSaleList[index].quantityController,
            titleText: 'Quantity'.tr,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
            ],
          ),
          const SizedBox(height: 13),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Currency'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: themeMode ? AppTheme.blue3 : AppTheme.white14,
                    ),
                  ),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField2(
                  isExpanded: true,
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  validator: (value) {
                    if (value == null) {
                      return 'Currency Validate'.tr;
                    }
                    return null;
                  },
                  items: currencyList
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ),
                            ),
                          ))
                      .toList(),
                  value: menuPageProvider.wholeSaleList[index].currency,
                  onChanged: (value) {},
                  icon: Center(
                    child: Image.asset(
                      'assets/icons/dropdown.png',
                      width: 10,
                      height: 6,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
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
                  buttonPadding: const EdgeInsets.only(left: 25, right: 17),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border:
                    //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),

                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
                  ),
                  // buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 32),
                  // dropdownMaxHeight: deviceHeight * 0.4,
                  dropdownMaxHeight: 350,
                  // dropdownWidth: deviceWidth,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
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
          const SizedBox(height: 13),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Price Validate'.tr;
              }
              return null;
            },
            controller: menuPageProvider.wholeSaleList[index].priceController,
            titleText: 'Price'.tr,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
            ],
          ),
          const SizedBox(height: 13),
          Row(
            children: [
              MaterialButton(
                minWidth: 70,
                height: 50,
                elevation: 0,
                color: AppTheme.blue2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.white1,
                  ),
                ),
                onPressed: () {
                  var country = Constants.language == 'tr' ? 'Turkey' : null;
                  var currency = Constants.language == 'tr' ? 'TRY' : null;
                  var countryCode = Constants.language == 'tr' ? 'TR' : null;
                  TextEditingController priceController =
                      TextEditingController();
                  TextEditingController quantityController =
                      TextEditingController();

                  WholeSaleModel wholeSaleModel = WholeSaleModel(
                      country: country,
                      currency: currency,
                      priceController: priceController,
                      countryCode: countryCode,
                      quantityController: quantityController,
                      type: 'wholesale');

                  menuPageProvider.updateWholeSaleList(
                      wholeSaleModel: wholeSaleModel);
                },
              ),
              const SizedBox(width: 8.0),
              MaterialButton(
                  minWidth: 70,
                  height: 50,
                  elevation: 0,
                  color: AppTheme.blue3,
                  disabledColor: AppTheme.blue3.withOpacity(.2),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  onPressed: menuPageProvider.wholeSaleList.length > 1
                      ? () {
                          menuPageProvider.deleteWholeSaleList(index);
                        }
                      : () {
                          menuPageProvider.deleteWholeSaleList(index);

                          menuPageProvider.updateSelectedWholeSale(false);
                        },
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.white1,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Container _getRetailSaleWidget(
      int index,
      List<CountryModel> countryList,
      BuildContext context,
      List<String> currencyList,
      MenuPageProvider menuPageProvider) {
    return Container(
      width: deviceWidth - 60,
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            (index + 1).toString() + (".Price").tr,
            style: TextStyle(
              fontSize: 14,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w400,
              color: themeMode ? AppTheme.blue3 : AppTheme.white14,
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Country'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: themeMode ? AppTheme.blue3 : AppTheme.white14,
                    ),
                  ),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField2(
                  isExpanded: true,
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  validator: (value) {
                    if (value == null) {
                      return 'Country Validate'.tr;
                    }
                    return null;
                  },
                  items: countryList
                      .map((item) => DropdownMenuItem<String?>(
                            value: item.name,
                            child: Text(
                              item.name ?? '',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ),
                            ),
                          ))
                      .toList(),
                  value: menuPageProvider.retailSaleList[index].country,

                  onChanged: (value) {
                    var countryIndex = countryList
                        .indexWhere(((element) => element.name == value));

                    menuPageProvider.updateRetailSaleList(
                        retailSaleModel: menuPageProvider.retailSaleList[index]
                            .copyWith(
                                country: value,
                                countryCode: countryList[countryIndex].code),
                        index: index);
                  },

                  icon: Center(
                    child: Image.asset(
                      'assets/icons/dropdown.png',
                      width: 10,
                      height: 6,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white15,
                    ),
                  ),
                  iconSize: 24,
                  buttonHeight: 57,
                  buttonWidth: deviceWidth,
                  buttonPadding: const EdgeInsets.only(left: 25, right: 17),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
                  ),
                  // buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 32),
                  // dropdownMaxHeight: deviceHeight * 0.4,
                  dropdownMaxHeight: 350,
                  // dropdownWidth: deviceWidth,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
                  ),
                  // dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 4,
                  scrollbarAlwaysShow: true,
                  // offset: const Offset(0, 180),

                  searchInnerWidget: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                    child: TextFormField(
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
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
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
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
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  searchController: TextEditingController(),
                  searchMatchFn: (item, searchValue) {
                    debugPrint("ITEM:${item.value}");

                    return (item.value
                        .toLowerCase()
                        .contains(searchValue.toLowerCase()));
                  },
                  //This to clear the search value when you close the menu
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {}
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          CustomTextFormField(
            titleText: 'Quantity'.tr,
            keyboardType: TextInputType.number,
            initialValue: '1',
            enabled: false,
          ),
          const SizedBox(height: 13),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Currency'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: themeMode ? AppTheme.blue3 : AppTheme.white14,
                    ),
                  ),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButtonFormField2(
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  validator: (value) {
                    if (value == null) {
                      return 'Currency Validate'.tr;
                    }
                    return null;
                  },
                  isExpanded: true,
                  items: currencyList
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ),
                            ),
                          ))
                      .toList(),
                  value: menuPageProvider.retailSaleList[index].currency,
                  onChanged: (value) {
                    menuPageProvider.updateRetailSaleList(
                        retailSaleModel:
                            menuPageProvider.retailSaleList[index].copyWith(
                          currency: value,
                        ),
                        index: index);
                  },
                  icon: Center(
                    child: Image.asset(
                      'assets/icons/dropdown.png',
                      width: 10,
                      height: 6,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white15,
                    ),
                  ),
                  iconSize: 24,
                  buttonHeight: 57,
                  buttonWidth: deviceWidth,
                  buttonPadding: const EdgeInsets.only(left: 25, right: 17),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
                  ),
                  // buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 32),
                  // dropdownMaxHeight: deviceHeight * 0.4,
                  dropdownMaxHeight: 350,
                  // dropdownWidth: deviceWidth,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
                  ),
                  // dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 4,
                  scrollbarAlwaysShow: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Price Validate'.tr;
              }
              return null;
            },
            titleText: 'Price'.tr,
            keyboardType: TextInputType.number,
            controller: menuPageProvider.retailSaleList[index].priceController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
            ],
          ),
          const SizedBox(height: 13),
          Row(
            children: [
              MaterialButton(
                minWidth: 70,
                height: 50,
                elevation: 0,
                color: AppTheme.blue2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                onPressed: () {
                  var country = Constants.language == 'tr' ? 'Turkey' : null;
                  var currency = Constants.language == 'tr' ? 'TRY' : null;
                  var countryCode = Constants.language == 'tr' ? 'TR' : null;
                  TextEditingController priceController =
                      TextEditingController();

                  RetailSaleModel retailSaleModel = RetailSaleModel(
                      country: country,
                      currency: currency,
                      priceController: priceController,
                      quantity: '1',
                      countryCode: countryCode,
                      type: 'retail');

                  menuPageProvider.updateRetailSaleList(
                      retailSaleModel: retailSaleModel);
                },
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.white1,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              MaterialButton(
                  minWidth: 70,
                  height: 50,
                  elevation: 0,
                  color: AppTheme.blue3,
                  enableFeedback: false,
                  disabledColor: AppTheme.blue3.withOpacity(.2),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  onPressed: menuPageProvider.retailSaleList.length > 1
                      ? () {
                          menuPageProvider.deleteRetailSaleList(index);
                        }
                      : () {
                          menuPageProvider.deleteRetailSaleList(index);

                          menuPageProvider.updateSelectedRetailSale(false);
                        },
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.white1,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Column _addImages(MenuPageProvider menuPageProvider) {
    return Column(
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
                color: themeMode ? AppTheme.blue3 : AppTheme.white1,
              ),
            ),
            const SizedBox(height: 13),
            MaterialButton(
                minWidth: deviceWidth,
                height: 52,
                elevation: 0,
                color: AppTheme.blue2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                padding: const EdgeInsets.fromLTRB(56, 43, 56, 38),
                child: Column(
                  children: [
                    Text(
                      'Add Product Image Info-1'.tr,
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: AppTheme.appFontFamily,
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
                          fontFamily: AppTheme.appFontFamily,
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
              visible: menuPageProvider.imageFilesList!.isNotEmpty,
              child: ListView.separated(
                controller: scrollController,
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                itemCount: menuPageProvider.imageFilesList!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 11);
                },
                itemBuilder: ((context, index) {
                  var image = menuPageProvider.imageFilesList![index];

                  String imageName = path.basename(image.path).substring(12);

                  var file = File(image.path);
                  String imageSize = formatBytes(file.lengthSync(), 2);

                  return Container(
                    width: deviceWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: themeMode ? AppTheme.white10 : AppTheme.black28,
                      ),
                      color: themeMode ? AppTheme.white5 : Colors.transparent,
                    ),
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: SizedBox(
                                width: deviceWidth * .5,
                                child: Text(
                                  imageName,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: AppTheme.appFontFamily,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
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
                                fontFamily: AppTheme.appFontFamily,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
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
                            color:
                                themeMode ? AppTheme.blue2 : AppTheme.white15,
                          ),
                          onPressed: () {
                            menuPageProvider.deleteSelectedImage(image);
                          },
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 11),
            editImageList != null
                ? ListView.separated(
                    controller: scrollController,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemCount: editImageList!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 11);
                    },
                    itemBuilder: ((context, index) {
                      var image = editImageList![index];

                      return Container(
                        width: deviceWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 1,
                            color:
                                themeMode ? AppTheme.white10 : AppTheme.black28,
                          ),
                          color:
                              themeMode ? AppTheme.white5 : Colors.transparent,
                        ),
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              color: AppTheme.white10,
                              child: Center(
                                child: Image.network(
                                  image.path,
                                  width: 59,
                                  height: 59,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Center(
                              child: SizedBox(
                                width: deviceWidth * .5,
                                child: Text(
                                  image.path,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: AppTheme.appFontFamily,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: themeMode
                                        ? AppTheme.blue3
                                        : AppTheme.white1,
                                  ),
                                ),
                              ),
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
                                editImageList!.removeAt(index);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }

  Column _status(List<String> statusList, BuildContext context,
      MenuPageProvider menuPageProvider) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Status'.tr,
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w400,
                color: themeMode ? AppTheme.blue3 : AppTheme.white14,
              ),
            ),
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2(
            isExpanded: true,
            decoration: const InputDecoration.collapsed(hintText: ''),
            validator: (value) {
              if (value == null) {
                return 'Status Validate'.tr;
              }
              return null;
            },
            items: statusList
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w400,
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.blue3
                                  : AppTheme.white1,
                        ),
                      ),
                    ))
                .toList(),
            value: menuPageProvider.selectedStatus,
            onChanged: (value) {
              menuPageProvider.updateSelectedStatus(value as String);
            },
            icon: Center(
              child: Image.asset(
                'assets/icons/dropdown.png',
                width: 10,
                height: 6,
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
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
            buttonPadding: const EdgeInsets.only(left: 25, right: 17),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // border:
              //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),

              color: Provider.of<ThemeProvider>(context).themeMode == "light"
                  ? AppTheme.white39
                  : AppTheme.black18,
            ),
            // buttonElevation: 2,
            itemHeight: 40,
            itemPadding: const EdgeInsets.symmetric(horizontal: 32),
            // dropdownMaxHeight: deviceHeight * 0.4,
            dropdownMaxHeight: 350,
            // dropdownWidth: deviceWidth,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Provider.of<ThemeProvider>(context).themeMode == "light"
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
    );
  }

  Column _productSummary(MenuPageProvider menuPageProvider) {
    return Column(
      children: [
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
            : menuPageProvider.isSelectedProductSummaryIndex == 2
                ? CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
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
                      if (value == null || value.trim().isEmpty) {
                        return 'Product Summary Validate'.tr;
                      }
                      return null;
                    },
                    controller: productSummaryDEController,
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
      ],
    );
  }

  Column _brand(List<BrandModel> brandList, BuildContext context,
      MenuPageProvider menuPageProvider) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Brand'.tr,
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w400,
                color: themeMode ? AppTheme.blue3 : AppTheme.white14,
              ),
            ),
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2(
            isExpanded: true,
            decoration: const InputDecoration.collapsed(hintText: ''),
            validator: (value) {
              if (value == null) {
                return 'Brand Validate'.tr;
              }
              return null;
            },
            items: brandList
                .map((item) => DropdownMenuItem<String>(
                      value: item.name,
                      child: Text(
                        item.name ?? '',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w400,
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.blue3
                                  : AppTheme.white1,
                        ),
                      ),
                    ))
                .toList(),
            value: menuPageProvider.selectedBrand,
            onChanged: (value) {
              menuPageProvider.updateSelectedBrand(value as String);

              var brandIndex =
                  brandList.indexWhere(((element) => element.name == value));
              if (brandIndex != -1) {
                debugPrint('BRAND INDEX: $brandIndex');
                debugPrint('BRAND ID: ${brandList[brandIndex].id}');

                brandId = brandList[brandIndex].id;
              }
            },
            icon: Center(
              child: Image.asset(
                'assets/icons/dropdown.png',
                width: 10,
                height: 6,
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.blue3
                    : AppTheme.white15,
              ),
            ),
            iconSize: 24,
            buttonHeight: 57,
            buttonWidth: deviceWidth,
            buttonPadding: const EdgeInsets.only(left: 25, right: 17),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Provider.of<ThemeProvider>(context).themeMode == "light"
                  ? AppTheme.white39
                  : AppTheme.black18,
            ),
            itemHeight: 40,
            itemPadding: const EdgeInsets.symmetric(horizontal: 32),
            dropdownMaxHeight: 350,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Provider.of<ThemeProvider>(context).themeMode == "light"
                  ? AppTheme.white39
                  : AppTheme.black18,
            ),
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 4,
            scrollbarAlwaysShow: true,
            searchController: brandController,
            searchInnerWidget: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: TextFormField(
                controller: brandController,

                onFieldSubmitted: (value) {
                  for (var element in brandList) {
                    if (element.name != value) {
                      brandList.add(BrandModel(name: value));
                      menuPageProvider.updateSelectedBrand(value);
                      setState(() {});
                    }
                  }
                },

                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w500,
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
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
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
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
                      color: Provider.of<ThemeProvider>(context).themeMode ==
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
    );
  }

  Column _sizes() {
    return Column(
      children: [
        CustomTextFormField(
          controller: widthController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Product Width Validate'.tr;
            }
            return null;
          },
          titleText: 'Width'.tr,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          suffixText: 'sm',
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        CustomTextFormField(
          controller: heightController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Product Height Validate'.tr;
            }
            return null;
          },
          titleText: 'Height'.tr,
          suffixText: 'cm',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        CustomTextFormField(
          controller: weightController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Product Weight Validate'.tr;
            }
            return null;
          },
          titleText: 'Weight'.tr,
          suffixText: 'gr',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        CustomTextFormField(
          controller: lengthController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Product Length Validate'.tr;
            }
            return null;
          },
          titleText: 'Length'.tr,
          suffixText: 'cm',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
          ],
        ),
      ],
    );
  }

  Column _productDescription(MenuPageProvider menuPageProvider) {
    return Column(
      children: [
        menuPageProvider.isSelectedProductDescriptionIndex == 1
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
            : menuPageProvider.isSelectedProductDescriptionIndex == 2
                ? CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Product Description Validate'.tr;
                      }
                      return null;
                    },
                    controller: productDescriptionENController,
                    titleText: 'Product Description'.tr,
                    minLines: 2,
                    maxLines: 5,
                  )
                : CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Product Description Validate'.tr;
                      }
                      return null;
                    },
                    controller: productDescriptionDEController,
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
      ],
    );
  }

  Column _productName(MenuPageProvider menuPageProvider) {
    return Column(
      children: [
        menuPageProvider.isSelectedProductNameIndex == 1
            ? CustomTextFormField(
                validator: (value) {
                  if ((value == null || value.trim().isEmpty)) {
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
                      if ((value == null || value.trim().isEmpty)) {
                        return 'Product Name Validate'.tr;
                      }
                      return null;
                    },
                    controller: productNameENController,
                    titleText: 'Product Name'.tr,
                  )
                : CustomTextFormField(
                    validator: (value) {
                      if ((value == null || value.trim().isEmpty)) {
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
      ],
    );
  }

  Visibility _categoryFeatures(MenuPageProvider menuPageProvider) {
    return Visibility(
        visible: menuPageProvider.categoryFeatureasList.isNotEmpty &&
            menuPageProvider.visibilitycategoryFeatureasList,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            controller: scrollController,
            itemCount: menuPageProvider.categoryFeatureasList.length,
            itemBuilder: (BuildContext context, int index) {
              var featureas =
                  menuPageProvider.categoryFeatureasList[index].feature;

              return featureas!.values!.isNotEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              featureas.label ?? '',
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
                        Container(
                          constraints: const BoxConstraints(
                              minWidth: double.infinity, maxHeight: 250),
                          decoration: BoxDecoration(
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.white39
                                  : AppTheme.black18,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 13.0),
                          child: Scrollbar(
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemCount: featureas.values!.length,
                                itemBuilder: ((context, index) {
                                  var feature = featureas.values![index];
                                  var isSelected = menuPageProvider
                                      .selectedFetureasList
                                      .contains(feature);

                                  return feature != null
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: InkWell(
                                            onTap: () {
                                              menuPageProvider
                                                  .updateSelectedFetureas(
                                                      selectedFetureasModel:
                                                          feature,
                                                      isSelected: !isSelected);
                                            },
                                            child: Row(
                                              children: [
                                                if (isSelected)
                                                  const Icon(
                                                      Icons.check_box_outlined)
                                                else
                                                  const Icon(Icons
                                                      .check_box_outline_blank),
                                                const SizedBox(width: 16),
                                                Text(
                                                  feature.displayedValue!,
                                                  style: const TextStyle(
                                                    fontSize: 14,
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
            }));
  }

  Visibility _deepCategories(
      MenuPageProvider menuPageProvider, BuildContext context) {
    return Visibility(
      visible: menuPageProvider.deepCategoryList.isNotEmpty &&
          menuPageProvider.visibilityDeepCategory,
      child: Column(
        children: [
          const SizedBox(
            height: 13,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Deep Categories'.tr,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white14,
                ),
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField2(
              isExpanded: true,
              decoration: const InputDecoration.collapsed(hintText: ''),
              validator: (value) {
                if (value == null) {
                  return 'Deep Categories Validate'.tr;
                }
                return null;
              },
              items: menuPageProvider.deepCategoryList
                  .map((item) => DropdownMenuItem<String>(
                        value: item.categoryName,
                        child: Text(
                          item.categoryName ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w400,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                          ),
                        ),
                      ))
                  .toList(),
              value: menuPageProvider.selectedDeepCategory,
              onChanged: (value) {
                menuPageProvider.updateSelectedDeepCategory(value as String);

                var deepCategoryIndex = menuPageProvider.deepCategoryList
                    .indexWhere(((element) => element.categoryName == value));

                if (deepCategoryIndex != -1) {
                  debugPrint('CATEGORY INDEX: $deepCategoryIndex');
                  debugPrint(
                      'CATEGORY ID: ${menuPageProvider.deepCategoryList[deepCategoryIndex].id}');

                  deepCategoryId =
                      menuPageProvider.deepCategoryList[deepCategoryIndex].id;
                  menuPageProvider.fetchCategoryFeatureasList(
                      categoryId: deepCategoryId!);

                  menuPageProvider.updateVisibilityCategoryFeatureas(true);
                }
              },

              icon: Center(
                child: Image.asset(
                  'assets/icons/dropdown.png',
                  width: 10,
                  height: 6,
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.blue3
                          : AppTheme.white15,
                ),
              ),
              iconSize: 24,
              buttonHeight: 57,
              buttonWidth: deviceWidth,
              buttonPadding: const EdgeInsets.only(left: 25, right: 17),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.white39
                    : AppTheme.black18,
              ),

              itemHeight: 40,
              itemPadding: const EdgeInsets.symmetric(horizontal: 32),
              dropdownMaxHeight: 350,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.white39
                    : AppTheme.black18,
              ),
              // dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 4,
              scrollbarAlwaysShow: true,
              // offset: const Offset(0, 180),

              searchInnerWidget: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w500,
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
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
                      color: Provider.of<ThemeProvider>(context).themeMode ==
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
                        color: Provider.of<ThemeProvider>(context).themeMode ==
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
    );
  }

  Visibility _subCategories(
      MenuPageProvider menuPageProvider, BuildContext context) {
    return Visibility(
      visible: menuPageProvider.subCategoryList.isNotEmpty &&
          menuPageProvider.visibilitySubCategory,
      child: Column(
        children: [
          const SizedBox(
            height: 13,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Sub Categories'.tr,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white14,
                ),
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField2(
              // alignment: AlignmentDirectional.center,
              isExpanded: true,
              decoration: const InputDecoration.collapsed(hintText: ''),
              validator: (value) {
                if (value == null) {
                  return 'Sub Categories Validate'.tr;
                }
                return null;
              },
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
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w400,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                          ),
                        ),
                      ))
                  .toList(),
              value: menuPageProvider.selectedSubCategory,

              onChanged: (value) {
                menuPageProvider.selectedDeepCategory = null;
                menuPageProvider.updateVisibilityDeepCategory(false);
                menuPageProvider.updateSelectedSubCategory(value as String);

                var subCategoryIndex = menuPageProvider.subCategoryList
                    .indexWhere(((element) => element.categoryName == value));
                if (subCategoryIndex != -1) {
                  debugPrint('CATEGORY INDEX: $subCategoryIndex');
                  debugPrint(
                      'CATEGORY ID: ${menuPageProvider.subCategoryList[subCategoryIndex].id}');

                  subCategoryId =
                      menuPageProvider.subCategoryList[subCategoryIndex].id;

                  Provider.of<MenuPageProvider>(context, listen: false)
                      .fetchDeepCategoryList(parentId: subCategoryId!);
                  menuPageProvider.updateVisibilityDeepCategory(true);
                }
              },

              icon: Center(
                child: Image.asset(
                  'assets/icons/dropdown.png',
                  width: 10,
                  height: 6,
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
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
              buttonPadding: const EdgeInsets.only(left: 25, right: 17),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // border:
                //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),

                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.white39
                    : AppTheme.black18,
              ),
              // buttonElevation: 2,
              itemHeight: 40,
              itemPadding: const EdgeInsets.symmetric(horizontal: 32),
              // dropdownMaxHeight: deviceHeight * 0.4,
              dropdownMaxHeight: 350,
              // dropdownWidth: deviceWidth,
              dropdownPadding: null,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
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
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
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
                      color: Provider.of<ThemeProvider>(context).themeMode ==
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
                        color: Provider.of<ThemeProvider>(context).themeMode ==
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
    );
  }

  Column _categories(List<CategoryModel> categoryList, BuildContext context,
      MenuPageProvider menuPageProvider) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Categories'.tr,
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w400,
                color: themeMode ? AppTheme.blue3 : AppTheme.white14,
              ),
            ),
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField2(
            // alignment: AlignmentDirectional.center,
            decoration: const InputDecoration.collapsed(hintText: ''),
            validator: (value) {
              if (value == null) {
                return 'Categories Validate'.tr;
              }
              return null;
            },
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
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
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
              menuPageProvider.updateVisibilitySubCategory(false);
              menuPageProvider.updateVisibilityDeepCategory(false);

              menuPageProvider.updateSelectedCategory(value as String);

              var categoryIndex = categoryList
                  .indexWhere(((element) => element.categoryName == value));
              if (categoryIndex != -1) {
                debugPrint('CATEGORY INDEX: $categoryIndex');
                debugPrint('CATEGORY ID: ${categoryList[categoryIndex].id}');

                categoryId = categoryList[categoryIndex].id;

                Provider.of<MenuPageProvider>(context, listen: false)
                    .fetchSubCategoryList(parentId: categoryId);

                menuPageProvider.updateVisibilitySubCategory(true);
              }
            },

            icon: Center(
              child: Image.asset(
                'assets/icons/dropdown.png',
                width: 10,
                height: 6,
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
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
            buttonPadding: const EdgeInsets.only(left: 25, right: 17),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // border:
              //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),

              color: Provider.of<ThemeProvider>(context).themeMode == "light"
                  ? AppTheme.white39
                  : AppTheme.black18,
            ),
            // buttonElevation: 2,
            itemHeight: 40,
            itemPadding: const EdgeInsets.symmetric(horizontal: 32),
            // dropdownMaxHeight: deviceHeight * 0.4,
            dropdownMaxHeight: 350,
            // dropdownWidth: deviceWidth,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Provider.of<ThemeProvider>(context).themeMode == "light"
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
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
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
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
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
                      color: Provider.of<ThemeProvider>(context).themeMode ==
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
    );
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

  void validationErrorDialog(BuildContext context, {String? message}) {
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
                            message != null
                                ? message.tr
                                : 'Validation Error Dialog'.tr,
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
