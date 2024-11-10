import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/models/test.dart';

class StoryPreview {
  String title;
  String? imageUrl;
  int id;
  String blurb;

  StoryPreview(
      {required this.title,
      required this.imageUrl,
      required this.id,
      required this.blurb});

  factory StoryPreview.fromJson(Map<String, dynamic> json) {
    return StoryPreview(
        id: json[Constants.storyPreviewIDKey],
        imageUrl: json[Constants.storyPreviewImageUrlKey],
        title: json[Constants.storyPreviewTitleKey],
        blurb: json[Constants.storyPreviewBlurbKey]);
  }

  Widget getImageWidget() {
    if (imageUrl == null) {
      return Image.asset("assets/paw.png");
    }
    return Image.network(
      imageUrl ?? "",
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }

  Future<Story> getStoryFromPreview() async {
    //TODO: implement story getting logic
    if (id == 545) {
      return defaultStory;
    } else {
      return defaultStory2;
    }
  }
}
