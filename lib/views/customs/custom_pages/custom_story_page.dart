import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_view/story_view.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/views/profile/company/company_profile_page.dart';
import 'package:b2geta_mobile/views/profile/personal/personal_profile_page.dart';

class CustomStoryPage extends StatefulWidget {
  const CustomStoryPage({
    Key? key,
    required this.stories,
    required this.index,
  }) : super(key: key);
  final List<List<FeedModel>> stories;
  final int index;

  @override
  State<CustomStoryPage> createState() => _CustomStoryPageState();
}

class _CustomStoryPageState extends State<CustomStoryPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late int _storyListIndex;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  final storyItems = <StoryItem>[];
  late StoryController _storyController;

  @override
  void initState() {
    super.initState();
    _storyListIndex = widget.index;
    _pageController = PageController();
    _storyController = StoryController();
  }

  void onComplete() {
    if (_storyListIndex + 1 < widget.stories.length) {
      _storyListIndex++;
      setState(() {});
      _pageController.nextPage(
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";
    final FeedModel story = widget.stories[_storyListIndex][0];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragUpdate: (details) => _onVerticalDragUpdate(details),
        onTapDown: (details) => onTapLeft(details, _storyListIndex - 1),
        onLongPress: (() {}),
        onLongPressEnd: ((details) {}),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.stories.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return StoryWidget(
                  storyList: widget.stories[_storyListIndex],
                  storyController: _storyController,
                  onComplete: () {
                    onComplete();
                  },
                );
              },
            ),
            Positioned(
              top: deviceTopPadding + 24.0,
              left: 20.0,
              right: 20.0,
              child: GestureDetector(
                onTap: () {
                  if (Provider.of<UserProvider>(context, listen: false)
                          .getUser
                          .id ==
                      (story.user!.id ?? '')) {
                    context
                        .read<NavigationPageProvider>()
                        .updateCurrentTabIndex(4);
                    Navigator.pop(context);
                  } else {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>
                              story.user!.type != 'company'
                                  ? PersonalProfilePage(
                                      userId: story.user!.id ?? '')
                                  : CompanyProfilePage(
                                      userId: story.user!.id ?? ''),
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
                    (story.user!.photo != null && story.user!.photo!.isNotEmpty)
                        ? ClipOval(
                            child: Image.network(
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                              story.user!.photo!,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                      "assets/images/dummy_images/user_profile.png"),
                            ),
                          )
                        : ClipOval(
                            child: Image.asset(
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                                "assets/images/dummy_images/user_profile.png"),
                          ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      (story.user!.name != null && story.user!.name!.length > 2)
                          ? story.user!.name!
                          : "User Name",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
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
      ),
    );
  }

  void onTapLeft(TapDownDetails details, int page) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    if (dx < screenWidth / 3) {
      if (_storyListIndex > 0) {
        _storyListIndex -= 1;
        setState(() {});
        _pageController.previousPage(
            duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
      } else if (dx > 2 * screenWidth / 3) {
        if (_storyListIndex + 1 < widget.stories.length) {
          _storyListIndex++;
          setState(() {});
          _pageController.nextPage(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn);
        } else {
          Navigator.pop(context);
        }
      }
    }
  }

  void _onVerticalDragUpdate(details) {
    int sensitivity = 8;
    if (details.delta.dy > sensitivity) {
      // Down Swipe
      Navigator.pop(context);
    } else if (details.delta.dy < -sensitivity) {
      // Up Swipe
    }
  }
}

class StoryWidget extends StatefulWidget {
  const StoryWidget({
    Key? key,
    required this.storyList,
    required this.storyController,
    this.onComplete,
    this.onVerticalSwipeComplete,
  }) : super(key: key);
  final List<FeedModel> storyList;
  final StoryController storyController;
  final Function()? onComplete;
  final dynamic Function(Direction?)? onVerticalSwipeComplete;

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  final storyItems = <StoryItem>[];

  @override
  void initState() {
    super.initState();
    addStoryItems();
  }

  void addStoryItems() {
    for (final story in widget.storyList) {
      storyItems.add(StoryItem.pageImage(
          url: story.images![0]!.url.toString(),
          controller: widget.storyController,
          duration: const Duration(seconds: 3)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: storyItems,
      controller: widget.storyController,
      onComplete: widget.onComplete,
      onVerticalSwipeComplete: widget.onVerticalSwipeComplete,
    );
  }
}
