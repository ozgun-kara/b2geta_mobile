import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/categories/category_featureas_model.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/product_added_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:path/path.dart' as path;

class AddProductImageSubPage extends StatefulWidget {
  const AddProductImageSubPage({
    Key? key,
    required this.accountId,
    required this.categoryId,
    required this.subCategoryId,
    required this.deepCategoryId,
    required this.categoryFeatures,
    required this.productName,
    required this.productDescription,
    required this.productSummary,
    required this.brand,
    required this.price,
    required this.currency,
    required this.status,
  }) : super(key: key);

  final String accountId;
  final String categoryId;
  final String subCategoryId;
  final String deepCategoryId;
  final List<CategoryFeatureasModelFeatureValues> categoryFeatures;
  final String productName;
  final String productDescription;
  final String productSummary;
  final String brand;
  final String price;
  final String currency;
  final String status;

  @override
  State<AddProductImageSubPage> createState() => _AddProductImageSubPageState();
}

class _AddProductImageSubPageState extends State<AddProductImageSubPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  ScrollController scrollController = ScrollController();
  final ImagePicker imagePicker = ImagePicker();

  void selectImages() async {
    final List<XFile> pickedFiles = await imagePicker.pickMultiImage();

    final List<File> selectedImages =
        pickedFiles.map<File>((xfile) => File(xfile.path)).toList();

    if (selectedImages.isNotEmpty) {
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
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      appBar: const CustomInnerAppBar(),
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
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
                  const SizedBox(height: 41),
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
                  Consumer<MenuPageProvider>(
                    builder: (context, menuPageProvider, child) {
                      return Visibility(
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

                            String imageName =
                                path.basename(image.path).substring(12);

                            final file = File(image.path);
                            String imageSize =
                                formatBytes(file.lengthSync(), 2);

                            return Container(
                              width: deviceWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
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
                              padding:
                                  const EdgeInsets.fromLTRB(12, 12, 12, 12),
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
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          imageName,
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
                                      color: themeMode
                                          ? AppTheme.blue2
                                          : AppTheme.white15,
                                    ),
                                    onPressed: () {
                                      menuPageProvider
                                          .deleteSelectedImage(image);
                                    },
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 28),
                  Consumer<MenuPageProvider>(
                    builder: (context, menuPageProvider, child) {
                      return MaterialButton(
                          minWidth: deviceWidth,
                          height: 52,
                          elevation: 0,
                          color: AppTheme.green1,
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
                            if (menuPageProvider.imageFilesList!.isNotEmpty) {
                              debugPrint("************************");
                              debugPrint("accountId: ${widget.accountId}");
                              debugPrint("categoryId: ${widget.categoryId}");
                              debugPrint("productName: ${widget.productName}");
                              debugPrint(
                                  "productDescription: ${widget.productDescription}");
                              debugPrint(
                                  "productSummary: ${widget.productSummary}");
                              debugPrint("brand: ${widget.brand}");
                              debugPrint("price: ${widget.price}");
                              debugPrint("currency: ${widget.currency}");
                              debugPrint("status: ${widget.status}");

                              loadingScreen(context);

                              locator<ProductsServices>()
                                  .addProductCall(
                                      accountId: widget.accountId,
                                      categoryId: widget.categoryId,
                                      subCategoryId: widget.subCategoryId,
                                      deepCategoryId: widget.deepCategoryId,
                                      productName: widget.productName,
                                      productDescription:
                                          widget.productDescription,
                                      productSummary: widget.productSummary,
                                      brand: widget.brand,
                                      price: widget.price,
                                      currency: widget.currency,
                                      status: widget.status,
                                      images: menuPageProvider.imageFilesList!,
                                      categoryFeatures: widget.categoryFeatures,)
                                  .then((value) {
                                if (value == true) {
                                  debugPrint("PRODUCT HAS SUCCESSFULLY ADDED");

                                  menuPageProvider
                                      .clearSelectedImageFilesList();

                                  var count = 0;

                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            const ProductAddedSubPage(),
                                        transitionDuration:
                                            const Duration(milliseconds: 0),
                                        reverseTransitionDuration:
                                            const Duration(milliseconds: 0),
                                        transitionsBuilder: (_, a, __, c) =>
                                            FadeTransition(
                                                opacity: a, child: c),
                                      ), (route) {
                                    return count++ == 2;
                                  }).then((_) => setState(() {}));
                                } else {
                                  debugPrint("PRODUCT HAS NOT ADDED");
                                  operationFailedDialog(context);
                                }
                              });
                            } else {
                              validationErrorDialog(context);
                            }
                          });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }

  void loadingScreen(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: CircularProgressIndicator(
                color: AppTheme.blue6,
              )),
        );
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
