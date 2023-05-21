import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/views/customs/custom_pages/story_widget.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  final List<List<FeedModel>> stories;
  final int index;
  const StoryPage({Key? key, required this.stories, required this.index})
      : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late PageController _pageController;
  late int _storyListIndex;

  @override
  void initState() {
    super.initState();

    _storyListIndex = widget.index;

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.stories.length,
      itemBuilder: (context, index) {
        final stories = widget.stories[_storyListIndex];
        return StoryWidget(
            stories: stories, pageController: _pageController, index: index);
      },
    );
  }
}
