import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget(
      {Key? key,
      required this.stories,
      required this.pageController,
      required this.index})
      : super(key: key);
  final List<FeedModel> stories;
  final PageController pageController;
  final int index;

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  final storyItems = <StoryItem>[];
  late StoryController _storyController;
  @override
  void initState() {
    super.initState();
    _storyController = StoryController();
    addStoryItems();
  }

  void addStoryItems() {
    for (final story in widget.stories) {
      storyItems.add(StoryItem.pageImage(
          url: story.images![0].toString(),
          controller: _storyController,
          duration: const Duration(seconds: 3)));
    }
  }

  void handleCompleted() {
    widget.pageController.nextPage(
        duration: const Duration(microseconds: 1), curve: Curves.easeOut);

    final currentIndex = widget.stories[widget.index];
    final isLastPage = widget.stories.length - 1 == currentIndex;
    if (isLastPage) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: storyItems,
      controller: _storyController,
      onComplete: handleCompleted,
      onVerticalSwipeComplete: (direction) {
        if(direction==Direction.down){
          Navigator.pop(context);
        }
      },
      onStoryShow: (storyItem) {},
    );
  }
}
