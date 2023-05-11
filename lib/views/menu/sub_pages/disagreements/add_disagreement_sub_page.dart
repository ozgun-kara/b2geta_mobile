import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_text_form_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'dart:ui';
import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class AddDisagreementSubPage extends StatefulWidget {
  const AddDisagreementSubPage({Key? key}) : super(key: key);

  @override
  State<AddDisagreementSubPage> createState() => _AddDisagreementSubPageState();
}

class _AddDisagreementSubPageState extends State<AddDisagreementSubPage> {
  ScrollController scrollController = ScrollController();
  GlobalKey<FormState> productGlobalKey = GlobalKey<FormState>();

  final orderNumberController = TextEditingController();
  final disagreementDescriptionController = TextEditingController();
  final requestController = TextEditingController();

  var categoryId;
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
        appBar: const CustomInnerAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  width: deviceWidth,
                  height: 1,
                  color: themeMode ? AppTheme.white32 : Colors.transparent),
              const SizedBox(height: 27),
              Text(
                'Disagreement Form'.tr,
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
                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 37),
                    child: Form(
                      key: productGlobalKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Order Number Validate'.tr;
                              }
                              return null;
                            },
                            controller: orderNumberController,
                            hintText: 'Order Number'.tr,
                            keyboardType: TextInputType.number,
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
                                    'Disagreement Category'.tr,
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
                            height: 13,
                          ),
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Order Number Validate'.tr;
                              }
                              return null;
                            },
                            controller: disagreementDescriptionController,
                            hintText: 'Disagreement Description'.tr,
                            minLines: 5,
                            maxLines: 5,
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          CustomTextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Request Validate'.tr;
                              }
                              return null;
                            },
                            controller: requestController,
                            hintText: 'Request'.tr,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 28),
                          MaterialButton(
                              minWidth: deviceWidth,
                              height: 52,
                              elevation: 0,
                              color: AppTheme.blue2,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(56, 43, 56, 38),
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
                                visible:
                                    menuPageProvider.imageFilesList!.isNotEmpty,
                                child: ListView.separated(
                                  controller: scrollController,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(0),
                                  itemCount:
                                      menuPageProvider.imageFilesList!.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(height: 11);
                                  },
                                  itemBuilder: ((context, index) {
                                    var image =
                                        menuPageProvider.imageFilesList![index];

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
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text(
                                                  imageName,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        AppTheme.appFontFamily,
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
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
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
                                'Send'.tr,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.white1),
                              ),
                              onPressed: () {}),
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
}
