import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/views/profile/company/company_profile_page.dart';
import 'package:b2geta_mobile/views/profile/personal/personal_profile_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:provider/provider.dart';

import '../../../providers/navigation_page_provider.dart';

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
  late AnimationController _animationController;
  late int _storyListIndex;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _storyListIndex = widget.index;
    _pageController = PageController();
    _animationController = AnimationController(vsync: this);

    final FeedModel firstStory = widget.stories[_storyListIndex].first;
    _loadStory(story: firstStory, animateToPage: false);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
        _animationController.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories[_storyListIndex].length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_storyListIndex][_currentIndex]);
          } else {
            // nav.pop
            if (_storyListIndex + 1 < widget.stories.length) {
              _storyListIndex += 1;
              _currentIndex = 0;
              _loadStory(story: widget.stories[_storyListIndex][_currentIndex]);
            } else {
              Navigator.pop(context);
            }
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FeedModel story = widget.stories[_storyListIndex][_currentIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        onVerticalDragUpdate: (details) => _onVerticalDragUpdate(details),
        onLongPress: (() {
          _animationController.stop();
        }),
        onLongPressEnd: ((details) {
          _animationController.forward();
        }),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.stories.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final storyUrl = story.images!.isNotEmpty
                    ? story.images![0]!.url
                    : "https://api.businessucces.com/uploads/posts/2023/01/13012023205120-1673639480.jpeg";
                if (storyUrl != null) {
                  return CachedNetworkImage(
                    imageUrl: storyUrl,
                    fit: BoxFit.fitWidth,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            Positioned(
              top: 40.0,
              left: 10.0,
              right: 10.0,
              child: Row(
                  children: widget.stories[_storyListIndex]
                      .asMap()
                      .map((i, e) {
                        return MapEntry(
                            i,
                            AnimatedBar(
                                animationController: _animationController,
                                position: i,
                                currentIndex: _currentIndex));
                      })
                      .values
                      .toList()),
            ),
            Positioned(
              top: 55.0,
              left: 10.0,
              right: 10.0,
              child: GestureDetector(
                onTap: () {
                  if (Provider.of<UserProvider>(context, listen: false)
                          .getUser
                          .id ==
                      (story.user!.id ?? '')) {
                    context
                        .read<NavigationPageProvider>()
                        .updateCurrentTabIndex(3);
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

  void _onTapDown(TapDownDetails details, FeedModel story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    //left click
    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: widget.stories[_storyListIndex][_currentIndex]);
        } else {
          if (_storyListIndex - 1 >= 0) {
            _storyListIndex -= 1;
            _currentIndex = widget.stories[_storyListIndex].length - 1;
            _loadStory(story: widget.stories[_storyListIndex][_currentIndex]);
          } else {
            _storyListIndex = 0;
            _currentIndex = 0;
            _loadStory(story: widget.stories[_storyListIndex][_currentIndex]);
          }
        }
      });
      //right click
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.stories[_storyListIndex].length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories[_storyListIndex][_currentIndex]);
        } else {
          //nav.pop
          if (_storyListIndex + 1 < widget.stories.length) {
            _storyListIndex += 1;
            _currentIndex = 0;
            _loadStory(story: widget.stories[_storyListIndex][_currentIndex]);
          } else {
            Navigator.pop(context);
          }
        }
      });
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

  void _loadStory({required FeedModel story, bool animateToPage = true}) {
    _animationController.stop();
    _animationController.reset();
    final storyDetails = story.images;

    if (storyDetails != null) {
      _animationController.duration = const Duration(seconds: 3);
      _animationController.forward();
    }

    if (animateToPage) {
      _pageController.animateToPage(_currentIndex,
          duration: const Duration(microseconds: 1), curve: Curves.easeOut);
    }
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    Key? key,
    required this.animationController,
    required this.position,
    required this.currentIndex,
  }) : super(key: key);
  final AnimationController animationController;
  final int position;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(children: [
              _buildContainer(
                double.infinity,
                position < currentIndex
                    ? Colors.white
                    : Colors.white.withOpacity(.5),
              ),
              position == currentIndex
                  ? AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return _buildContainer(
                            constraints.maxWidth * animationController.value,
                            Colors.white);
                      },
                    )
                  : const SizedBox.shrink(),
            ]);
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 3.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: .8,
        ),
        borderRadius: BorderRadius.circular(1.0),
      ),
    );
  }
}
