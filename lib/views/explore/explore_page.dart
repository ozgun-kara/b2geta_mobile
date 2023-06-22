import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/explore_page_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_post_item_widget.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_reels_page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  void initState() {
    super.initState();
    getExplore();
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          if (Provider.of<ExplorePageProvider>(context, listen: false)
              .isMoreData) {
            getExplore();
          }
        }
      },
    );
  }

  Future getExplore() async {
    Provider.of<ExplorePageProvider>(context, listen: false).getExploreList();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Consumer<ExplorePageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
          body: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));
              provider.onRefresh();
            },
            color: Colors.black,
            child: provider.exploreList.isNotEmpty
                ? StaggeredGridView.countBuilder(
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 2.0,
                    crossAxisSpacing: 2.0,
                    itemCount: provider.exploreList.length,
                    staggeredTileBuilder: (int index) {
                      var discover = provider.exploreList[index];
                      return StaggeredTile.count(
                          1,
                          (discover.type == 'reels' && (index % 3 == 0))
                              ? 2
                              : 1);
                    },
                    itemBuilder: (context, index) {
                      var discover = provider.exploreList[index];
                      if (index < provider.exploreList.length) {
                        return Container(
                          color: themeMode ? AppTheme.white4 : AppTheme.black3,
                          child: discover.type == 'reels'
                              ? InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              CustomReelsPageViewWidget(
                                            reelsList: [discover],
                                            videoUrlIndex: index,
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
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: discover.videos!.isNotEmpty
                                            ? Image.network(
                                                discover.videos![0]!.image ??
                                                    'assets/images/image_not_found.jpg',
                                                width: 128,
                                                height: 256,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/image_not_found.jpg',
                                                  width: 128,
                                                  height: 256,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : Image.asset(
                                                'assets/images/image_not_found.jpg',
                                                width: 128,
                                                height: 256,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      const Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.slow_motion_video,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : (discover.type == 'feed' &&
                                      discover.images!.isNotEmpty)
                                  ? InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (_, __, ___) =>
                                                  CustomPostItemWidget(
                                                feed: discover,
                                              ),
                                              transitionDuration:
                                                  const Duration(
                                                      milliseconds: 0),
                                              reverseTransitionDuration:
                                                  const Duration(
                                                      milliseconds: 0),
                                              transitionsBuilder:
                                                  (_, a, __, c) =>
                                                      FadeTransition(
                                                          opacity: a, child: c),
                                            ));
                                      },
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            discover.images![0]!.url!,
                                            fit: BoxFit.cover,
                                          ),
                                          Visibility(
                                            visible: discover.images!.length > 1
                                                ? true
                                                : false,
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: IgnorePointer(
                                                child: Container(
                                                  width: 37,
                                                  height: 37,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF2F2F2F)
                                                            .withOpacity(.66),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        "assets/icons/post_image_add.png",
                                                        width: 18,
                                                        height: 18,
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
                                  : const SizedBox(),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )
                : const SizedBox(),
          ),
        );
      },
    );
  }
}
