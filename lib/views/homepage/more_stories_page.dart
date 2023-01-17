
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import 'package:b2geta_mobile/models/feed_model.dart';

class MoreStories extends StatefulWidget {
  const MoreStories({
    Key? key,
    required this.stories,
  }) : super(key: key);
  final List<FeedModel> stories;

  @override
  State<MoreStories> createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final StoryController _storyController = StoryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        storyItems: [
          for (var story in widget.stories)
            story.images![0] != null
                ? StoryItem.pageImage(
                    url: story.images![0]!.url.toString(),
                    caption: "Still sampling",
                    controller: _storyController,
                  )
                : StoryItem.pageImage(
                    url:
                        "https://media.giphy.com/media/4EbPq54Rbx5UvBXsRx/giphy.gif",
                    caption: "Still sampling",
                    controller: _storyController,
                  )
        ],
        onStoryShow: (s) {},
        onComplete: () {
          Navigator.pop(context);
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: _storyController,
      ),
    );
  }
}
