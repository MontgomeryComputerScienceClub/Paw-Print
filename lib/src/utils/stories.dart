import 'package:flutter/material.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/routes/noanimation.dart';
import 'package:myapp/src/screens/article/entirearticle.dart';

void pushFromPreviewToStory(StoryPreview preview, BuildContext context) async {
  var story = await preview.getStoryFromPreview();

  //TODO get related stories

  // ignore: use_build_context_synchronously
  Navigator.of(context).push(NoAnimationRoute(
      child: EntireArticlePage(
    main: story,
    relatedStories: [],
  )));
}
