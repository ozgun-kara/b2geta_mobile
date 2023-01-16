import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class MoreStories extends StatefulWidget {
  const MoreStories({Key? key}) : super(key: key);

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
          StoryItem.text(
            title: "Nice!\n\nTap to continue.",
            backgroundColor: Colors.red,
            textStyle: const TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageImage(
            url:
                "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
            caption: "Still sampling",
            controller: _storyController,
          ),
          StoryItem.pageImage(
              url: "https://media.giphy.com/media/gKIyqq4JESg4p3RW8V/giphy.gif",
              caption: "Working with gifs",
              controller: _storyController),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/4EbPq54Rbx5UvBXsRx/giphy.gif",
            caption: "Hello, from the other side",
            controller: _storyController,
          ),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/LYRSRTWa9oD8fdvV4C/giphy.gif",
            caption: "Hello, from the other side2",
            controller: _storyController,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: _storyController,
      ),
    );
  }
}
