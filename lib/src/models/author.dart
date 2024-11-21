import 'package:flutter/material.dart';
import 'package:myapp/src/models/storypreview.dart';

class Author {
  String name;
  int graduationYear;
  String bio;
  String? profilepicurl;

  //TODO: may need to optimize w/ IDs later
  List<StoryPreview> stories;

  Author({
    required this.name,
    required this.bio,
    required this.graduationYear,
    required this.profilepicurl,
    required this.stories,
  });

  Widget getProfileImageWidget() {
    if (profilepicurl == null) {
      return Image.asset("assets/paw.png");
    }
    return Image.network(
      profilepicurl ?? "",
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.error);
      },
    );
  }
}
