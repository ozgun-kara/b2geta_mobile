import 'package:b2geta_mobile/models/products/product_model.dart';
import 'package:b2geta_mobile/models/user/user_model.dart';
import 'package:b2geta_mobile/providers/my_account_page_provider.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:b2geta_mobile/views/marketplace/sub_pages/product_detail_sub_page.dart';
import 'package:b2geta_mobile/views/my_account/info/my_account_info_sub_page.dart';
import 'package:b2geta_mobile/views/my_account/posts/my_account_posts_sub_page.dart';
import 'package:b2geta_mobile/views/my_account/products/my_account_products_sub_page.dart';
import 'package:b2geta_mobile/views/my_account/reels/my_account_reels_sub_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_pages/custom_story_page.dart';

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
              expandedHeight: 200,
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
                                              ? CachedNetworkImage(
                                                  imageUrl:
                                                      "${Provider.of<UserProvider>(context).getUser.avatar}",
                                                  fit: BoxFit.cover,
                                                  errorWidget: (context, error,
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
                                          ? CachedNetworkImage(
                                              imageUrl: "${user.avatar}",
                                              fit: BoxFit.cover,
                                              errorWidget:
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
                                  Provider.of<UserProvider>(context)
                                              .getUser
                                              .type ==
                                          'company'
                                      ? user.companyName ?? ''
                                      : '${user.firstname ?? ''} ${user.lastname ?? ''}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: themeMode
                                        ? AppTheme.blue3
                                        : AppTheme.white1,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: deviceWidth,
                          height: 1,
                          color:
                              themeMode ? AppTheme.white31 : AppTheme.black2),
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
                ? MyAccountPostPage(
                    userId: Provider.of<UserProvider>(context)
                        .getUser
                        .id
                        .toString(),
                  )
                : provider.currentTabIndex == 1
                    ? MyAccountReelsPage(
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
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: SizedBox(
                                        height: deviceHeight,
                                        child:
                                            FutureBuilder<List<ProductModel>>(
                                          future: ProductsServices()
                                              .productsListAndSearchCall(
                                                  queryParameters: {
                                                "limit": '1000000',
                                              }),
                                          builder: (context, data) {
                                            if (data.hasData) {
                                              var productList = data.data;
                                              if (productList!.isNotEmpty) {
                                                return GridView.builder(
                                                  controller: scrollController,
                                                  shrinkWrap: true,
                                                  itemCount: productList.length,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          14, 0, 14, 0),
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 21,
                                                    mainAxisExtent: 304,
                                                  ),
                                                  itemBuilder:
                                                      ((context, index) {
                                                    var product =
                                                        productList[index];

                                                    return InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            PageRouteBuilder(
                                                              pageBuilder: (_,
                                                                      __,
                                                                      ___) =>
                                                                  ProductDetailSubPage(
                                                                productId:
                                                                    product.id!,
                                                              ),
                                                              transitionDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          0),
                                                              reverseTransitionDuration:
                                                                  const Duration(
                                                                      milliseconds:
                                                                          0),
                                                              transitionsBuilder: (_,
                                                                      a,
                                                                      __,
                                                                      c) =>
                                                                  FadeTransition(
                                                                      opacity:
                                                                          a,
                                                                      child: c),
                                                            ));
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: Colors
                                                                    .transparent),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              // width: 126,
                                                              // height: 145,
                                                              width:
                                                                  deviceWidth,
                                                              height: 206,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          9),
                                                                ),
                                                              ),
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl: product
                                                                        .images!
                                                                        .isNotEmpty
                                                                    ? product
                                                                        .images![
                                                                            0]
                                                                        .url!
                                                                    : 'https://doraev.com/images/custom/product-images/nophoto.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Image.asset(
                                                                  'assets/images/image_not_found.jpg',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 11),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  product
                                                                      .name!.tr
                                                                      .toString(),
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        AppTheme
                                                                            .appFontFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: themeMode
                                                                        ? AppTheme
                                                                            .blue3
                                                                        : AppTheme
                                                                            .white11,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 2),
                                                                RichText(
                                                                    text: TextSpan(
                                                                        children: [
                                                                      TextSpan(
                                                                        text:
                                                                            "${product.price.toString()} ",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color: themeMode
                                                                              ? AppTheme.blue2
                                                                              : AppTheme.white1,
                                                                        ),
                                                                      ),
                                                                      TextSpan(
                                                                        text:
                                                                            "₺",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color: themeMode
                                                                              ? AppTheme.blue2
                                                                              : AppTheme.white1,
                                                                        ),
                                                                      )
                                                                    ])),
                                                                const SizedBox(
                                                                    height: 2),
                                                                Text(
                                                                  "10 ${'Minimum Order'.tr}",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        AppTheme
                                                                            .appFontFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppTheme
                                                                        .white15,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              } else {
                                                return SizedBox(
                                                  width: deviceWidth,
                                                  height: deviceHeight - 200,
                                                  child: Center(
                                                      child: Text(
                                                    "Ürün bulunmamaktadır.",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: AppTheme
                                                          .appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )),
                                                );
                                              }
                                            } else {
                                              return SizedBox(
                                                height: deviceWidth + 115,
                                                child: Center(
                                                    child:
                                                        CupertinoActivityIndicator(
                                                  color: themeMode
                                                      ? AppTheme.black1
                                                      : AppTheme.white1,
                                                  radius: 12,
                                                )),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    );
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
