import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/social/notification_page.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  final SocialServices _socialServices = SocialServices();
  List<NotificationModel> notificationList = [];

  @override
  void initState() {
    super.initState();
    getNotifications();
  }

  getNotifications() async {
    _socialServices.getNotifications(queryParameters: {
      "limit": '1000',
    }).then((value) {
      if (value.isNotEmpty) {
        setState(() {
          notificationList = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      appBar: AppBar(
        toolbarHeight: 68,
        backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            splashRadius: 24,
            icon: Image.asset(
              'assets/icons/back-2.png',
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
      ),
      body: Column(
        children: [
          const SizedBox(height: 27),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text(
                  'Notifications'.tr,
                  style: TextStyle(
                    fontFamily: AppTheme.appFontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(26, 0, 24, 90),
              child: notificationList.isNotEmpty
                  ? ListView.builder(
                      itemCount: notificationList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var notification = notificationList[index];
                        debugPrint("${notification.content}bildirim");
                        return Column(
                          children: [
                            notification.type == 'video_encoded'
                                ? Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/notification.png',
                                        width: 36,
                                        height: 36,
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        'Your reels video is active'.tr,
                                        style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: themeMode
                                              ? AppTheme.blue3
                                              : AppTheme.white1,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '1 ${"Min".tr}',
                                        style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.white15,
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      ClipOval(
                                        child: Image.network(
                                          width: 36,
                                          height: 36,
                                          notification.user!.photo.toString(),
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              "assets/images/dummy_images/user_profile.png",
                                              width: 20,
                                              height: 20,
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        '${notification.user!.name ?? ''} ',
                                        style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: themeMode
                                              ? AppTheme.blue3
                                              : AppTheme.white1,
                                        ),
                                      ),
                                      Text(
                                        notification.content.toString(),
                                        style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.white15,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '1 ${"Min".tr}',
                                        style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.white15,
                                        ),
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 16),
                          ],
                        );
                      },
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Column newMethod() {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/icons/notification.png',
              width: 36,
              height: 36,
            ),
            const SizedBox(width: 7),
            Text(
              'Your reels video is active'.tr,
              style: TextStyle(
                fontFamily: AppTheme.appFontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: themeMode ? AppTheme.blue3 : AppTheme.white1,
              ),
            ),
            const Spacer(),
            Text(
              '1 ${"Min".tr}',
              style: TextStyle(
                fontFamily: AppTheme.appFontFamily,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppTheme.white15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://s2.gifyu.com/images/com.vicman.newprofilepic.icon.2022-06-07-21-33-07.png",
                  ),
                  fit: BoxFit.cover,
                ),
                color: Color.fromRGBO(225, 230, 250, 0.8),
              ),
            ),
            const SizedBox(width: 7),
            Text(
              'Hasan Demir ',
              style: TextStyle(
                fontFamily: AppTheme.appFontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: themeMode ? AppTheme.blue3 : AppTheme.white1,
              ),
            ),
            Text(
              'Commented on your photo'.tr,
              style: TextStyle(
                fontFamily: AppTheme.appFontFamily,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppTheme.white15,
              ),
            ),
            const Spacer(),
            Text(
              '1 ${"Min".tr}',
              style: TextStyle(
                fontFamily: AppTheme.appFontFamily,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppTheme.white15,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
