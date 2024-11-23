import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';

class Author {
  String name;
  int graduationYear;
  String bio;
  String? profilepicurl;
  List<int> storyIDs;

  Author({
    required this.name,
    required this.bio,
    required this.graduationYear,
    required this.profilepicurl,
    required this.storyIDs,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    List<int> storyIds = json[Constants.authorStoryPreviewKey] as List<int>;

    return Author(
        name: json[Constants.authorNameKey],
        bio: json[Constants.authorBioKey],
        graduationYear: json[Constants.authorGradYearKey],
        profilepicurl: json[Constants.authorProfilePicUrl],
        storyIDs: storyIds);
  }

  @override
  String toString() {
    return "$name '${graduationYear % 100}";
  }

  List<StoryPreview> getStories() {
    //TODO implement logic here
    return [];
  }

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
