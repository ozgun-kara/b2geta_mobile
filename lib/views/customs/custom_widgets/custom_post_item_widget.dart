import 'package:b2geta_mobile/views/customs/custom_pages/custom_comment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_gallery_widget.dart';
import 'package:b2geta_mobile/views/profile/company/company_profile_page.dart';
import 'package:b2geta_mobile/views/profile/personal/personal_profile_page.dart';

import 'custom_app_bar.dart';

class CustomPostItemWidget extends StatefulWidget {
  const CustomPostItemWidget({
    Key? key,
    required this.feed,
  }) : super(key: key);
  final FeedModel feed;

  @override
  State<CustomPostItemWidget> createState() => _CustomPostItemWidgetState();
}

class _CustomPostItemWidgetState extends State<CustomPostItemWidget> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  final SocialServices _socialServices = SocialServices();

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
        backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
        appBar: const CustomAppBar(),
        body: Container(
          width: deviceWidth,
          color: themeMode ? AppTheme.white1 : AppTheme.black7,
          margin: const EdgeInsets.symmetric(vertical: 6.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              Container(
                width: deviceWidth,
                height: 40,
                margin: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (Provider.of<UserProvider>(context, listen: false)
                                  .getUser
                                  .id ==
                              (widget.feed.user!.id ?? '')) {
                            context
                                .read<NavigationPageProvider>()
                                .updateCurrentTabIndex(3);
                          } else {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => widget
                                              .feed.user!.type !=
                                          'company'
                                      ? PersonalProfilePage(
                                          userId: widget.feed.user!.id ?? '')
                                      : CompanyProfilePage(
                                          userId: widget.feed.user!.id ?? ''),
                                  transitionDuration:
                                      const Duration(milliseconds: 0),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 0),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ));
                          }
                        },
                        child: Row(
                          children: [
                            widget.feed.user!.photo!.isNotEmpty
                                ? ClipOval(
                                    child: Image.network(
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                      widget.feed.user!.photo!,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        "assets/images/dummy_images/user_profile.png",
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : ClipOval(
                                    child: Image.asset(
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                      "assets/images/dummy_images/user_profile.png",
                                    ),
                                  ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Flexible(
                              flex: 3,
                              child: Text(
                                widget.feed.user!.name ?? "",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w800,
                                  color: themeMode
                                      ? AppTheme.blue3
                                      : AppTheme.white1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Text(
                              ' ${'Homepage Share-2'.tr}',
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.white15,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/icons/post_menu.png",
                        color: themeMode ? AppTheme.blue3 : AppTheme.white12,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                  top: 10,
                  right: 36,
                ),
                child: Text(
                  widget.feed.content!.length > 1
                      ? widget.feed.content.toString()
                      : "",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: themeMode ? AppTheme.black9 : AppTheme.white9,
                  ),
                ),
              ),
              if (widget.feed.images!.isNotEmpty)
                Column(
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      width: deviceWidth,
                      height: 279,
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              List<String> imgList = [];

                              for (var i in widget.feed.images!) {
                                imgList.add(i!.url.toString());
                              }

                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        CustomGalleryWidget(
                                      urlImages: imgList,
                                    ),
                                    transitionDuration:
                                        const Duration(milliseconds: 0),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 0),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(opacity: a, child: c),
                                  ));
                            },
                            child: Image.network(
                              widget.feed.images![0]!.url.toString(),
                              width: deviceWidth,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                "assets/images/dummy_images/image_not_found.jpg",
                                width: deviceWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Visibility(
                            visible:
                                widget.feed.images!.length > 1 ? true : false,
                            child: Positioned(
                              top: 231,
                              right: 20,
                              child: IgnorePointer(
                                child: Container(
                                  width: 59,
                                  height: 37,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2F2F2F)
                                        .withOpacity(.66),
                                    borderRadius: BorderRadius.circular(13.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/post_image_add.png",
                                        width: 18,
                                        height: 18,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        (widget.feed.images!.length - 1)
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.white1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              else
                const SizedBox(),
              Container(
                height: 49,
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (widget.feed.likeStatus!) {
                            _socialServices.feedUnLikeCall(
                                feedId: widget.feed.id!);
                          } else {
                            _socialServices.feedLikeCall(
                                feedId: widget.feed.id!);
                          }
                        },
                        child: SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/icons/like.png",
                                width: 15,
                                height: 15,
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                widget.feed.likeStatus!
                                    ? 'Like-2'.tr
                                    : 'Like-1'.tr,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.white15,
                                ),
                              ),
                            ],
                          ),
                        )),
                    TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => CustomCommentPage(
                                  feedId: widget.feed.id!,
                                  user: widget.feed.user!,
                                  content: widget.feed.content!,
                                ),
                                transitionDuration:
                                    const Duration(milliseconds: 0),
                                reverseTransitionDuration:
                                    const Duration(milliseconds: 0),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(opacity: a, child: c),
                              ));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/comment2.png",
                              width: 17.5,
                              height: 17.5,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              'Comment-1'.tr,
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white15,
                              ),
                            ),
                          ],
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/share.png",
                              width: 18,
                              height: 15,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              'Homepage Share-3'.tr,
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white15,
                              ),
                            ),
                          ],
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/save.png",
                              width: 12,
                              height: 15,
                            ),
                            const SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              'Save'.tr,
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white15,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              const Divider(height: 1),
              Container(
                width: deviceWidth,
                padding: const EdgeInsets.only(
                    left: 14, top: 11, bottom: 7, right: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: AppTheme.appFontFamily,
                                color: AppTheme.white15,
                              ),
                              children: [
                                TextSpan(
                                  text: widget.feed.likes!.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${'Like-3'.tr}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: AppTheme.appFontFamily,
                                color: AppTheme.white15,
                              ),
                              children: [
                                TextSpan(
                                  text: widget.feed.comments!.total!.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${'Comment-2'.tr}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: AppTheme.appFontFamily,
                                color: AppTheme.white15,
                              ),
                              children: [
                                const TextSpan(
                                  text: '93',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${'Homepage Share-4'.tr}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "4s",
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.white15,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<NavigationPageProvider>()
                            .updateCurrentTabIndex(3);
                      },
                      child: ClipOval(
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
                                  '${context.watch<UserProvider>().getUser.avatar}',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      "assets/images/dummy_images/user_profile.png",
                                      fit: BoxFit.cover,
                                    );
                                  },
                                )
                              : Image.asset(
                                  "assets/images/dummy_images/user_profile.png",
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 11.0,
                    ),
                    Expanded(
                        child: SizedBox(
                      height: 32.0,
                      child: TextField(
                        readOnly: true,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.blue3,
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          filled: true,
                          fillColor:
                              themeMode ? AppTheme.white3 : AppTheme.black7,
                          hintText: 'Comment-3'.tr,
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w600,
                            color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(41.0),
                            borderSide: BorderSide(color: AppTheme.white15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(41.0),
                            borderSide: BorderSide(color: AppTheme.white15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(41.0),
                            borderSide: BorderSide(color: AppTheme.white15),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => CustomCommentPage(
                                  feedId: widget.feed.id!,
                                  user: widget.feed.user!,
                                  content: widget.feed.content!,
                                ),
                                transitionDuration:
                                    const Duration(milliseconds: 0),
                                reverseTransitionDuration:
                                    const Duration(milliseconds: 0),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(opacity: a, child: c),
                              ));
                        },
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 18.0),
            ],
          ),
        ));
  }
}
