import 'package:flutter/material.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/models/test.dart';
import 'package:myapp/src/routes/noanimation.dart';
import 'package:myapp/src/screens/article/entirearticle.dart';
import 'package:share_plus/share_plus.dart';

void pushFromPreviewToStory(StoryPreview preview, BuildContext context) async {
  var story = await preview.getStoryFromPreview();

  //TODO get related stories

  // ignore: use_build_context_synchronously
  Navigator.of(context).push(NoAnimationRoute(
      child: EntireArticlePage(
    main: story,
    relatedStories: [defaultStory2, defaultStory, defaultStory2, defaultStory],
  )));
}

void shareStory(StoryPreview s) {
  //TODO implement shareStory
  //TODO: implement share url has to link to website url somehow? so modify model later
  Share.share('https://example.com', subject: 'Share article');
}
