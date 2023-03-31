import 'dart:ui';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:b2geta_mobile/views/profile/company/company_profile_page.dart';
import 'package:b2geta_mobile/views/profile/personal/personal_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_app_bar.dart';

class CustomCommentPage extends StatefulWidget {
  const CustomCommentPage({
    Key? key,
    required this.feedId,
    required this.user,
    required this.content,
  }) : super(key: key);
  final String feedId;
  final FeedModelUser user;
  final String content;

  @override
  State<CustomCommentPage> createState() => _CustomCommentPageState();
}

class _CustomCommentPageState extends State<CustomCommentPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  List<FeedModelCommentsComments> comments = [];
  final SocialServices _socialServices = SocialServices();
  final TextEditingController _commentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getComments();
  }

  Future<void> getComments() async {
    await _socialServices.getCommentsCall(feedId: widget.feedId).then((value) {
      comments = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";
    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black18,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: deviceTopPadding,
          ),
          Container(
            width: deviceWidth,
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (Provider.of<UserProvider>(context, listen: false)
                            .getUser
                            .id ==
                        (widget.user.id ?? '')) {
                      context
                          .read<NavigationPageProvider>()
                          .updateCurrentTabIndex(3);
                      Navigator.pop(context);
                    } else {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                widget.user.type != 'company'
                                    ? PersonalProfilePage(
                                        userId: widget.user.id ?? '')
                                    : CompanyProfilePage(
                                        userId: widget.user.id ?? ''),
                            transitionDuration: const Duration(milliseconds: 0),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 0),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ));
                    }
                  },
                  child: Row(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.white1,
                          ),
                          child: widget.user.photo!.isNotEmpty
                              ? Image.network(
                                  widget.user.photo.toString(),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                        fit: BoxFit.cover,
                                        "assets/images/dummy_images/user_profile.png");
                                  },
                                )
                              : Image.asset(
                                  "assets/images/dummy_images/user_profile.png"),
                        ),
                      ),
                      const SizedBox(
                        width: 11.0,
                      ),
                      Text(
                        widget.user.name.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w700,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  widget.content,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: comments.isNotEmpty
                ? ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (BuildContext context, int index) {
                      var comment = comments[index];
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          padding: const EdgeInsets.only(left: 12, bottom: 24),
                          alignment: Alignment.centerLeft,
                          child: const Icon(Icons.delete),
                        ),
                        secondaryBackground: Container(
                          padding: const EdgeInsets.only(right: 12, bottom: 24),
                          alignment: Alignment.centerRight,
                          child: const Icon(Icons.delete),
                        ),
                        confirmDismiss: (direction) async {
                          return await alertDialog(
                              message: 'Silmek istediğinizden emin misiniz?',
                              confirmButtonColor: Colors.green,
                              confirmButtonText: 'Evet',
                              cancelButtonColor: Colors.red,
                              cancelButtonText: 'Hayır',
                              onPressed: () async {
                                await _socialServices
                                    .deleteCommentCall(commentId: comment.id!)
                                    .then((value) {
                                  if (value) {
                                    Navigator.pop(context);
                                    getComments();
                                  }
                                });
                              });
                        },
                        child: Container(
                          width: deviceWidth,
                          padding:
                              const EdgeInsets.only(left: 12, bottom: 24.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppTheme.white1,
                                      ),
                                      child: Image.network(
                                        comment.user!.photo!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 11.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        left: 13,
                                        top: 13,
                                        bottom: 9,
                                      ),
                                      margin: const EdgeInsets.only(right: 13),
                                      decoration: BoxDecoration(
                                        color: themeMode
                                            ? const Color(0xFFF4FBFC)
                                            : const Color(0xFF575B7D),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            comment.user!.name.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w700,
                                              color: themeMode
                                                  ? AppTheme.blue3
                                                  : AppTheme.white1,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 6.0,
                                          ),
                                          Text(
                                            comment.content!,
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
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 9.0,
                              ),
                              Container(
                                width: deviceWidth,
                                padding:
                                    const EdgeInsets.only(left: 71, right: 23),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Like-1'.tr,
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w700,
                                            color: themeMode
                                                ? AppTheme.blue3
                                                : AppTheme.white15,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          'Answer'.tr,
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w700,
                                            color: themeMode
                                                ? AppTheme.blue3
                                                : AppTheme.white15,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "4s",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: themeMode
                                                ? AppTheme.blue3
                                                : AppTheme.white15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/icons/like.png",
                                          width: 11,
                                          height: 10,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "1.741",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w700,
                                            color: AppTheme.white15,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 12.0,
              left: 12.0,
              bottom: 18.0,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.white1,
                      ),
                      child: (Provider.of<UserProvider>(context)
                                      .getUser
                                      .avatar !=
                                  null &&
                              Provider.of<UserProvider>(context)
                                  .getUser
                                  .avatar!
                                  .isNotEmpty)
                          ? Image.network(
                              'https://api.businessucces.com/${context.watch<UserProvider>().getUser.avatar}',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                    "assets/images/dummy_images/user_profile.png");
                              },
                            )
                          : Image.asset(
                              "assets/images/dummy_images/user_profile.png")),
                ),
                const SizedBox(
                  width: 11.0,
                ),
                Expanded(
                  child: SizedBox(
                    height: 32.0,
                    child: TextField(
                      controller: _commentTextController,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w600,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 14, top: 11),
                        filled: true,
                        fillColor: themeMode
                            ? const Color(0XFFFAFBFE)
                            : AppTheme.black7,
                        hintText: 'Comment-3'.tr,
                        hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w600,
                            color:
                                themeMode ? AppTheme.blue3 : AppTheme.white1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(41.0),
                          borderSide: BorderSide(
                            color: themeMode
                                ? const Color(0xFFE2E7F8)
                                : const Color(0xFF65688A),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(41.0),
                          borderSide: BorderSide(
                            color: themeMode
                                ? const Color(0xFFE2E7F8)
                                : const Color(0xFF65688A),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(41.0),
                          borderSide: BorderSide(
                            color: themeMode
                                ? const Color(0xFFE2E7F8)
                                : const Color(0xFF65688A),
                          ),
                        ),
                      ),
                      onSubmitted: (value) async {
                        if (_commentTextController.text.isNotEmpty) {
                          await _socialServices
                              .createCommentCall(
                            feedId: widget.feedId,
                            content: _commentTextController.text.trim(),
                          )
                              .then((value) {
                            if (value) {
                              _commentTextController.clear();
                              getComments();
                            }
                          });
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  alertDialog(
      {required String message,
      required String confirmButtonText,
      required confirmButtonColor,
      required String cancelButtonText,
      required cancelButtonColor,
      required VoidCallback onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(4),
            backgroundColor: Colors.transparent,
            content: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.white1
                          : AppTheme.black12,
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.warning_rounded,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Alert'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.black25
                                    : AppTheme.white1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 40),
                      Expanded(
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
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
                            color: cancelButtonColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Text(
                              cancelButtonText,
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
                            color: confirmButtonColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            onPressed: () {
                              onPressed();
                            },
                            child: Text(
                              confirmButtonText,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.white1),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
