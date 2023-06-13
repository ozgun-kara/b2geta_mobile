import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/profile/personal_profile_model.dart';
import 'package:b2geta_mobile/providers/personal_profile_page_provider.dart';
import 'package:b2geta_mobile/services/follow_services/follow_services.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:b2geta_mobile/views/customs/custom_pages/custom_reels_page.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_app_bar.dart';
import 'package:b2geta_mobile/views/profile/personal/posts/personal_posts_sub_page.dart';
import 'package:b2geta_mobile/views/profile/personal/reels/personal_reels_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_pages/custom_story_page.dart';

class PersonalProfilePage extends StatefulWidget {
  const PersonalProfilePage({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final String userId;

  @override
  State<PersonalProfilePage> createState() => _PersonalProfilePageState();
}

class _PersonalProfilePageState extends State<PersonalProfilePage> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  PersonalProfileModel? personalProfileModel;

  final MemberServices _memberServices = MemberServices();

  @override
  void initState() {
    Provider.of<PersonalProfilePageProvider>(context, listen: false)
        .getMyStories(widget.userId);
    getProfile();
    super.initState();
  }

  getProfile() async {
    await _memberServices
        .getPersonalProfileCall(userId: widget.userId)
        .then((value) {
      if (value != null) {
        personalProfileModel = value;
        setState(() {});
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
      appBar: const CustomAppBar(),
      body: Consumer<PersonalProfilePageProvider>(
        builder: (context, PersonalProfilePageProvider provider, child) {
          return CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
              expandedHeight: 275,
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
                                          child: personalProfileModel != null
                                              ? personalProfileModel!
                                                      .photo!.isNotEmpty
                                                  ? Image.network(
                                                      personalProfileModel!
                                                          .photo!,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context,
                                                          error, stackTrace) {
                                                        return Image.asset(
                                                          "assets/images/dummy_images/user_profile.png",
                                                          fit: BoxFit.cover,
                                                        );
                                                      },
                                                    )
                                                  : Image.asset(
                                                      "assets/images/dummy_images/user_profile.png",
                                                      fit: BoxFit.cover,
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
                                            width: 1, color: AppTheme.white21),
                                      ),
                                      child: personalProfileModel != null
                                          ? personalProfileModel!
                                                  .photo!.isNotEmpty
                                              ? Image.network(
                                                  personalProfileModel!.photo!,
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
                                  personalProfileModel != null
                                      ? personalProfileModel!.name.toString()
                                      : '',
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
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
                            SizedBox(
                              height: 22,
                              child: ButtonTheme(
                                minWidth: double.minPositive,
                                height: 22,
                                child: MaterialButton(
                                    elevation: 0,
                                    color: AppTheme.blue2,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(36)),
                                    ),
                                    padding:
                                        const EdgeInsets.fromLTRB(13, 2, 13, 0),
                                    child: Text(
                                      (personalProfileModel != null)
                                          ? (personalProfileModel!
                                                      .followStatus ??
                                                  false)
                                              ? 'Unfollow'.tr
                                              : 'Follow'.tr
                                          : 'Follow'.tr,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.white1,
                                      ),
                                    ),
                                    onPressed: () {
                                      debugPrint("PERSONAL ID: " +
                                          personalProfileModel!.id.toString());

                                      if (personalProfileModel != null) {
                                        if (personalProfileModel!
                                                .followStatus ??
                                            false) {
                                          // UNFOLLOW COMPANY
                                          debugPrint("UNFOLLOW PERSON");

                                          locator<FollowServices>()
                                              .unfollowCall(
                                                  userId: personalProfileModel!
                                                      .id
                                                      .toString())
                                              .then((value) {
                                            if (value == true) {
                                              debugPrint(
                                                  "PERSONAL SUCCESSFULLY UNFOLLOWED");
                                            } else {
                                              debugPrint(
                                                  "THE PERSONAL IS NOT UNFOLLOWED");
                                            }
                                          });
                                        } else {
                                          // FOLLOW COMPANY
                                          debugPrint("FOLLOW PERSON");

                                          locator<FollowServices>()
                                              .followCall(
                                                  userId: personalProfileModel!
                                                      .id
                                                      .toString())
                                              .then((value) {
                                            if (value == true) {
                                              debugPrint(
                                                  "PERSONAL SUCCESSFULLY FOLLOWED");
                                            } else {
                                              debugPrint(
                                                  "THE PERSONAL IS NOT FOLLOWED");
                                            }
                                          });
                                        }
                                      } else {}
                                    }),
                              ),
                            ),
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
                  ],
                ),
              ),
            ),
            provider.currentTabIndex == 0
                ? PersonalProfilePostSubPage(
                    userId: widget.userId,
                  )
                : PersonalProfileReelsSubPage(userId: widget.userId),
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
