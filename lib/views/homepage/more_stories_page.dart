import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import 'package:b2geta_mobile/models/feed_model.dart';

import '../../app_theme.dart';

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
      body: Stack(
        children: [
          StoryView(
            storyItems: [
              for (var story in widget.stories)
                story.images![0] != null
                    ? StoryItem.pageImage(
                        url: story.images![0]!.url.toString(),
                        controller: _storyController,
                      )
                    : StoryItem.pageImage(
                        url:
                            "https://media.giphy.com/media/4EbPq54Rbx5UvBXsRx/giphy.gif",
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
          Positioned(
            top: 50,
            left: 21,
            child: Row(children: [
              SizedBox(
                width: 43,
                height: 43,
                child: ClipOval(
                  child: widget.stories[0].user!.photo!.isNotEmpty
                      ? Image.network(widget.stories[0].user!.photo!)
                      : Image.asset(
                          "assets/images/dummy_images/post_profile.png",
                        ),
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 189,
                    child: Text(
                      widget.stories[0].user!.name!.length > 2
                          ? widget.stories[0].user!.name!
                          : "SİLVERLİNE ENDÜSTRİ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
