import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/models/feed_model.dart';
import 'package:b2geta_mobile/providers/company_profile_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:b2geta_mobile/views/homepage/story_page.dart';
import 'package:b2geta_mobile/views/profile/company/info/company_info_sub_page.dart';
import 'package:b2geta_mobile/views/profile/company/posts/company_posts_sub_page.dart';
import 'package:b2geta_mobile/views/profile/company/products/company_products_sub_page.dart';
import 'package:b2geta_mobile/views/profile/company/reels/company_reels_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyProfilePage extends StatefulWidget {
  const CompanyProfilePage({Key? key}) : super(key: key);

  @override
  State<CompanyProfilePage> createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  final SocialServices _socialServices = SocialServices();
  List<FeedModel> meStories = [];

  @override
  void initState() {
    Provider.of<CompanyProfilePageProvider>(context, listen: false).getFeeds();
    Provider.of<CompanyProfilePageProvider>(context, listen: false).getReels();
    getMeStories();

    super.initState();
  }

  void getMeStories() async {
    await _socialServices.getAllMeStoryCall(
        queryParameters: {"offset": "0", "type": "story"},
        userId: Constants.userId.toString()).then((feedList) {
      meStories = feedList;
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
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      body: Consumer<CompanyProfilePageProvider>(
        builder: (context, CompanyProfilePageProvider provider, child) {
          return CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
              expandedHeight: 252,
              pinned: true,
              centerTitle: false,
              leading: const SizedBox(),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  width: deviceWidth,
                  color: themeMode ? AppTheme.white1 : AppTheme.black5,
                  child: Column(
                    children: [
                      Container(
                          width: deviceWidth,
                          height: 1,
                          color:
                              themeMode ? AppTheme.white31 : AppTheme.black2),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 25, 16, 24),
                        child: Column(
                          children: [
                            meStories.isNotEmpty
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => StoryPage(
                                          stories: [meStories],
                                          index: 0,
                                        ),
                                      ));
                                    },
                                    child: Container(
                                      width: 55,
                                      height: 55,
                                      margin: const EdgeInsets.only(
                                        right: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0XFF29B7D6),
                                          width: 2,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Container(
                                            width: 55,
                                            height: 55,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppTheme.white21),
                                            ),
                                            child: Image.network(
                                              "https://api.businessucces.com/${context.watch<UserProvider>().getUser.avatar}",
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                  )
                                : ClipOval(
                                    child: Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1, color: AppTheme.white21),
                                      ),
                                      child: Image.network(
                                        "https://api.businessucces.com/${context.watch<UserProvider>().getUser.avatar}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                            const SizedBox(height: 18),

                            Column(
                              children: [
                                Text(
                                  '${context.watch<UserProvider>().getUser.firstname} ${context.watch<UserProvider>().getUser.lastname}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.blue3
                                        : AppTheme.white1,
                                  ),
                                ),
                                Text(
                                  "İstanbul, Türkiye",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white15),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),
                            // SizedBox(
                            //   height: 22,
                            //   child: ButtonTheme(
                            //     minWidth: double.minPositive,
                            //     height: 22,
                            //     child: MaterialButton(
                            //         elevation: 0,
                            //         color: AppTheme.blue2,
                            //         shape: const RoundedRectangleBorder(
                            //           borderRadius:
                            //               BorderRadius.all(Radius.circular(36)),
                            //         ),
                            //         padding:
                            //             const EdgeInsets.fromLTRB(13, 2, 13, 0),
                            //         child: Text(
                            //           'Follow'.tr,
                            //           style: TextStyle(
                            //             fontSize: 11,
                            //             fontFamily: AppTheme.appFontFamily,
                            //             fontWeight: FontWeight.w700,
                            //             color: AppTheme.white1,
                            //           ),
                            //         ),
                            //         onPressed: () {}),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                          width: deviceWidth,
                          height: 1,
                          color:
                              themeMode ? AppTheme.white31 : AppTheme.black2),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                titlePadding: const EdgeInsets.all(0),
                expandedTitleScale: 1,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ButtonTheme(
                        height: 49,
                        child: MaterialButton(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            elevation: 0,
                            child: FittedBox(
                              fit: BoxFit.none,
                              child: Image.asset('assets/icons/post.png',
                                  width: 21,
                                  height: 21,
                                  color: provider.currentTabIndex == 0
                                      ? themeMode
                                          ? AppTheme.blue2
                                          : AppTheme.white1
                                      : AppTheme.white15),
                            ),
                            onPressed: () {
                              provider.updateCurrentTabIndex(0);
                            }),
                      ),
                    ),
                    Expanded(
                      child: ButtonTheme(
                        height: 49,
                        child: MaterialButton(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            elevation: 0,
                            child: FittedBox(
                              fit: BoxFit.none,
                              child: Image.asset('assets/icons/case-play.png',
                                  width: 23,
                                  height: 22,
                                  color: provider.currentTabIndex == 1
                                      ? themeMode
                                          ? AppTheme.blue2
                                          : AppTheme.white1
                                      : AppTheme.white15),
                            ),
                            onPressed: () {
                              provider.updateCurrentTabIndex(1);
                            }),
                      ),
                    ),
                    Expanded(
                      child: ButtonTheme(
                        height: 49,
                        child: MaterialButton(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            elevation: 0,
                            child: FittedBox(
                              fit: BoxFit.none,
                              child: Image.asset(
                                  'assets/icons/shopping_car_arrow.png',
                                  width: 21,
                                  height: 21,
                                  color: provider.currentTabIndex == 2
                                      ? themeMode
                                          ? AppTheme.blue2
                                          : AppTheme.white1
                                      : AppTheme.white15),
                            ),
                            onPressed: () {
                              provider.updateCurrentTabIndex(2);
                            }),
                      ),
                    ),
                    Expanded(
                      child: ButtonTheme(
                        height: 49,
                        child: MaterialButton(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            elevation: 0,
                            child: FittedBox(
                              fit: BoxFit.none,
                              child: Image.asset('assets/icons/star2.png',
                                  width: 21,
                                  height: 20,
                                  color: provider.currentTabIndex == 3
                                      ? themeMode
                                          ? AppTheme.blue2
                                          : AppTheme.white1
                                      : AppTheme.white15),
                            ),
                            onPressed: () {
                              provider.updateCurrentTabIndex(3);
                            }),
                      ),
                    ),
                    Expanded(
                      child: ButtonTheme(
                        height: 49,
                        child: MaterialButton(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            elevation: 0,
                            child: FittedBox(
                              fit: BoxFit.none,
                              child: Image.asset('assets/icons/info.png',
                                  width: 21,
                                  height: 21,
                                  color: provider.currentTabIndex == 4
                                      ? themeMode
                                          ? AppTheme.blue2
                                          : AppTheme.white1
                                      : AppTheme.white15),
                            ),
                            onPressed: () {
                              provider.updateCurrentTabIndex(4);
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            provider.currentTabIndex == 0
                ? const CompanyPostsSubPage()
                : provider.currentTabIndex == 1
                    ? const CompanyReelsSubPage()
                    : provider.currentTabIndex == 2
                        ? const CompanyProductsSubPage()
                        : provider.currentTabIndex == 3
                            ? SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  childCount: 1,
                                  (context, index) {
                                    return Container(height: deviceHeight);
                                  },
                                ),
                              )
                            : const CompanyInfoSubPage(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 80,
              ),
            )
          ]);
        },
      ),
    );
  }
}
