import 'package:b2geta_mobile/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:b2geta_mobile/models/feed_model.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({
    Key? key,
    required this.stories,
  }) : super(key: key);
  final List<FeedModel> stories;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _animationController = AnimationController(vsync: this);

    final FeedModel firstStory = widget.stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
        _animationController.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory(story: widget.stories[_currentIndex]);
          } else {
            //nav.pop
            Navigator.pop(context);
            // _currentIndex = 0;
            // _loadStory(story: widget.stories[_currentIndex]);
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
    final FeedModel story = widget.stories[_currentIndex];
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
                final story = widget.stories[_currentIndex].images![0];
                if (story != null) {
                  return CachedNetworkImage(
                    imageUrl: story.url!,
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
                  children: widget.stories
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
              child: Row(
                children: [
                  (story.user!.photo != null && story.user!.photo!.isNotEmpty)
                      ? Image.network(
                          width: 30,
                          height: 30,
                          story.user!.photo!,
                        )
                      : Image.asset(
                          width: 30,
                          height: 30,
                          "assets/images/dummy_images/post_profile.png"),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    (story.user!.name != null && story.user!.name!.length > 2)
                        ? story.user!.name!
                        : "SİLVERLİNE ENDÜSTRİ",
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
          _loadStory(story: widget.stories[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < widget.stories.length) {
          _currentIndex += 1;
          _loadStory(story: widget.stories[_currentIndex]);
        } else {
          //nav.pop
          Navigator.pop(context);
          // _currentIndex = 0;
          // _loadStory(story: widget.stories[_currentIndex]);
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
    final storyDetails = story.images![0];

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
