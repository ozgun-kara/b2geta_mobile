import 'package:b2geta_mobile/models/user/user_model.dart';
import 'package:b2geta_mobile/providers/my_account_page_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_pages/custom_post_page.dart';
import 'package:b2geta_mobile/views/customs/custom_pages/custom_reels_page.dart';
import 'package:b2geta_mobile/views/my_account/info/my_account_info_sub_page.dart';
import 'package:b2geta_mobile/views/my_account/products/my_account_products_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_pages/cutom_story_page.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;
  late UserModel user;

  @override
  void initState() {
    Provider.of<MyAccountPageProvider>(context, listen: false).getMyStories(
        Provider.of<UserProvider>(context, listen: false)
            .getUser
            .id
            .toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";
    user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      body: Consumer<MyAccountPageProvider>(
        builder: (context, MyAccountPageProvider provider, child) {
          return CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
              expandedHeight: 228,
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
                            provider.myStoriesList.isNotEmpty
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                CustomStoryPage(
                                              stories: [provider.myStoriesList],
                                              index: 0,
                                            ),
                                            transitionDuration:
                                                const Duration(milliseconds: 0),
                                            reverseTransitionDuration:
                                                const Duration(milliseconds: 0),
                                            transitionsBuilder: (_, a, __, c) =>
                                                FadeTransition(
                                                    opacity: a, child: c),
                                          ));
                                    },
                                    child: Container(
                                      width: 55,
                                      height: 55,
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
                                          child: (Provider.of<UserProvider>(
                                                              context)
                                                          .getUser
                                                          .avatar !=
                                                      null &&
                                                  Provider.of<UserProvider>(
                                                          context)
                                                      .getUser
                                                      .avatar!
                                                      .isNotEmpty)
                                              ? Image.network(
                                                  "https://api.businessucces.com/${Provider.of<UserProvider>(context).getUser.avatar}",
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
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
                                  )
                                : ClipOval(
                                    child: Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 0, color: AppTheme.white21),
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
                                              "https://api.businessucces.com/${user.avatar}",
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
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
                            const SizedBox(height: 18),
                            Column(
                              children: [
                                Text(
                                  '${user.firstname ?? ''} ${user.lastname ?? ''}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: themeMode
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
                        height: 43,
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
                        height: 43,
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
                    Provider.of<UserProvider>(context).getUser.type == 'company'
                        ? Expanded(
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
                          )
                        : const SizedBox(),
                    Provider.of<UserProvider>(context).getUser.type == 'company'
                        ? Expanded(
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
                          )
                        : const SizedBox(),
                    Provider.of<UserProvider>(context).getUser.type == 'company'
                        ? Expanded(
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
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            provider.currentTabIndex == 0
                ? CustomPostPage(
                    userId: Provider.of<UserProvider>(context)
                        .getUser
                        .id
                        .toString(),
                  )
                : provider.currentTabIndex == 1
                    ? CustomReelsPage(
                        userId: Provider.of<UserProvider>(context)
                            .getUser
                            .id
                            .toString(),
                      )
                    : provider.currentTabIndex == 2
                        ? const MyAccountProductsSubPage()
                        : provider.currentTabIndex == 3
                            ? SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  childCount: 1,
                                  (context, index) {
                                    return Container(height: deviceHeight);
                                  },
                                ),
                              )
                            : const MyAccountInfoSubPage(),
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
