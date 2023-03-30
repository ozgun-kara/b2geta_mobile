import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_pages/custom_comment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';

class CompanyPostsSubPage extends StatefulWidget {
  const CompanyPostsSubPage({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final String userId;

  @override
  State<CompanyPostsSubPage> createState() => _CompanyPostsSubPageState();
}

class _CompanyPostsSubPageState extends State<CompanyPostsSubPage> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  bool isList = false;

  final SocialServices _socialServices = SocialServices();
  List<FeedModel> feeds = [];

  final TextEditingController _commentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getFeeds();
  }

  void getFeeds() async {
    await _socialServices.getFeedCall(
        queryParameters: {"offset": "0", "limit": "25", "type": "feed"},
        userId: widget.userId).then((feedList) {
      feeds = feedList;
    });
    setState(() {});
  }

  FocusNode commentFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: feeds.length,
        (context, index) {
          var feed = feeds[index];
          return Container(
            width: deviceWidth,
            color: themeMode ? AppTheme.white1 : AppTheme.black7,
            margin: const EdgeInsets.symmetric(vertical: 6.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  width: deviceWidth,
                  height: 40,
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          feed.user!.photo!.isNotEmpty
                              ? ClipOval(
                                  child: Image.network(
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                    feed.user!.photo!,
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
                          RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: AppTheme.appFontFamily,
                                ),
                                children: [
                                  TextSpan(
                                    text: feed.user!.name ?? "Name",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${'Homepage Share-2'.tr}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white15,
                                    ),
                                  ),
                                ]),
                          ),
                        ],
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
                    feed.content!.length > 1
                        ? feed.content.toString()
                        : "TEST POST",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: themeMode ? AppTheme.black9 : AppTheme.white9,
                    ),
                  ),
                ),
                if (feed.images!.isNotEmpty)
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
                            Image.network(
                              feed.images![0]!.url.toString(),
                              width: deviceWidth,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                "assets/images/dummy_images/image_not_found",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 231,
                              right: 20,
                              child: Container(
                                width: 59,
                                height: 37,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF2F2F2F).withOpacity(.66),
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
                                      "8",
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
                            if (feed.likeStatus!) {
                              _socialServices.feedUnLikeCall(feedId: feed.id!);
                            } else {
                              _socialServices.feedLikeCall(feedId: feed.id!);
                            }
                            getFeeds();
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
                                  feed.likeStatus! ? 'Like-2'.tr : 'Like-1'.tr,
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
                                MaterialPageRoute(
                                  builder: (context) => CustomCommentPage(
                                    feedId: feed.id!,
                                    user: feed.user!,
                                    content: feed.content!,
                                  ),
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
                                    text: feed.likes!.toString(),
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
                                    text: feed.comments!.total!.toString(),
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
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                              color: AppTheme.blue3,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(41.0),
                              borderSide: BorderSide(
                                  color: themeMode
                                      ? AppTheme.white10
                                      : AppTheme.black7),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(41.0),
                              borderSide: BorderSide(
                                  color: themeMode
                                      ? AppTheme.white10
                                      : AppTheme.black7),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(41.0),
                              borderSide: BorderSide(
                                  color: themeMode
                                      ? AppTheme.white10
                                      : AppTheme.black7),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CustomCommentPage(
                                    feedId: feed.id!,
                                    user: feed.user!,
                                    content: feed.content!,
                                  ),
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
          );
        },
      ),
    );
  }
}
