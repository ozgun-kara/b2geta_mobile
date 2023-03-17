import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/feed_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/views/custom_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  List<FeedModelCommentsComments?>? comments = [
    FeedModelCommentsComments.fromJson({
      "id": "51",
      "user": {
        "id": "408",
        "type": "personal",
        "username": "user_408",
        "name": "User 408",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-09 21:29:18",
      "content": "görüşlerinizi iletin"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "52",
      "user": {
        "id": "57",
        "type": "personal",
        "username": "user_57",
        "name": "Mehmet Can",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-10 21:29:18",
      "content": "Daha iyi olabilirdi"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "53",
      "user": {
        "id": "408",
        "type": "personal",
        "username": "user_408",
        "name": "User 408",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-11 21:29:18",
      "content": "Çok beğendim"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "52",
      "user": {
        "id": "93",
        "type": "personal",
        "username": "user_93",
        "name": "Ali Yunus",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-12 21:29:18",
      "content": "İdare eder"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "51",
      "user": {
        "id": "408",
        "type": "personal",
        "username": "user_408",
        "name": "User 408",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-09 21:29:18",
      "content": "görüşlerinizi iletin"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "52",
      "user": {
        "id": "57",
        "type": "personal",
        "username": "user_57",
        "name": "Mehmet Can",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-10 21:29:18",
      "content": "Daha iyi olabilirdi"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "53",
      "user": {
        "id": "408",
        "type": "personal",
        "username": "user_408",
        "name": "User 408",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-11 21:29:18",
      "content": "Çok beğendim"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "52",
      "user": {
        "id": "93",
        "type": "personal",
        "username": "user_93",
        "name": "Ali Yunus",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-12 21:29:18",
      "content": "İdare eder"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "51",
      "user": {
        "id": "408",
        "type": "personal",
        "username": "user_408",
        "name": "User 408",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-09 21:29:18",
      "content": "görüşlerinizi iletin"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "52",
      "user": {
        "id": "57",
        "type": "personal",
        "username": "user_57",
        "name": "Mehmet Can",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-10 21:29:18",
      "content": "Daha iyi olabilirdi"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "53",
      "user": {
        "id": "408",
        "type": "personal",
        "username": "user_408",
        "name": "User 408",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-11 21:29:18",
      "content": "Çok beğendim"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "52",
      "user": {
        "id": "93",
        "type": "personal",
        "username": "user_93",
        "name": "Ali Yunus",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-12 21:29:18",
      "content": "İdare eder"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "51",
      "user": {
        "id": "408",
        "type": "personal",
        "username": "user_408",
        "name": "User 408",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-09 21:29:18",
      "content": "görüşlerinizi iletin"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "52",
      "user": {
        "id": "57",
        "type": "personal",
        "username": "user_57",
        "name": "Mehmet Can",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-10 21:29:18",
      "content": "Daha iyi olabilirdi"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "53",
      "user": {
        "id": "408",
        "type": "personal",
        "username": "user_408",
        "name": "User 408",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-11 21:29:18",
      "content": "Çok beğendim"
    }),
    FeedModelCommentsComments.fromJson({
      "id": "52",
      "user": {
        "id": "93",
        "type": "personal",
        "username": "user_93",
        "name": "Ali Yunus",
        "photo": "assets/images/dummy_images/user_profile.png",
        "cover": ""
      },
      "create_date": "2023-01-12 21:29:18",
      "content": "İdare eder"
    }),
  ];

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    //Provider.of<ThemeProvider>(context, listen: false).setDarkMode();
    //Provider.of<ThemeProvider>(context, listen: false).setLightMode();
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";
    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black18,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: deviceTopPadding,
          ),
          const Divider(),
          Expanded(
            child: comments != null
                ? ListView.builder(
                    itemCount: comments!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var comment = comments![index];
                      return Container(
                        width: deviceWidth,
                        padding: const EdgeInsets.only(left: 12, bottom: 24.0),
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
                                    child: Image.asset(
                                        comment!.user!.photo.toString()),
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          comment.user!.name.toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: AppTheme.appFontFamily,
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
                                            fontFamily: AppTheme.appFontFamily,
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
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w600,
                            color:
                                themeMode ? AppTheme.blue3 : AppTheme.white1),
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
                        onSubmitted: (value) async {}),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
