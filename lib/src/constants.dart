import 'package:flutter/material.dart';

class Constants {
  static const Color gold = Color.fromARGB(255, 255, 215, 0);
  static const Color darkGold = Color.fromARGB(255, 239, 203, 2);
  static const Color green = Colors.green;
  static const Color black = Colors.black;
  static const Color red = Colors.red;
  static const Color listArticleBlurbColor = Color.fromARGB(255, 100, 100, 100);
  static const Color bottomAppBarColor = Color.fromARGB(255, 251, 251, 249);
  static const Color authorProfilePicBGColor = Color.fromARGB(255, 230, 230, 224);
  static const Color savedStoriesBottomModalBGColor = Color.fromARGB(255, 230, 230, 224);
  static const Color lifePreviewBackgroundColor = Colors.black12;
  static const Color homePagePreviewBlockBGColor = Color.fromARGB(255, 234, 232, 232);

  static const Size bannerPaintSize = Size(100, 100);
  static const Size worldPoliticsBlobSize = Size(55, 55);

  static const String storyPreviewImageUrlKey = "imgUrl";
  static const String storyPreviewTitleKey = "title";
  static const String storyPreviewIDKey = "id";
  static const String storyPreviewBlurbKey = "blurb";
  static const String storyPreviewReadTimeKey = "readTime";

  static const String storyContentKey = "content";
  static const String storyAuthorsKey = "authors";
  static const String storyMonthKey = "month";
  static const String storyYearKey = "year";
  static const String storyColumnKey = "column";

  static const String authorNameKey = "name";
  static const String authorBioKey = "bio";
  static const String authorGradYearKey = "gradYear";
  static const String authorProfilePicUrl = "picUrl";
  static const String authorStoryPreviewKey = "storyIDs";

  static const String infoIssueKey = "issue";

  static const List<String> columns = [
    "Print Editions",
    "Life",
    "Perspectives",
    "This Issue",
    "World/Politics",
    "Entertainment",
    "Sports",
  ];
  static const int columnsPrintEditionsIndex = 0;
  static const int columnsLifeIndex = 1;
  static const int columnsPerspectivesIndex = 2;
  static const int columnsThisIssueIndex = 3;
  static const int columnsWorldPoliticsIndex = 4;
  static const int columnsEntertainmentIndex = 5;
  static const int columnsSportsIndex = 6;

  static const String diskInfoKey = "pawprint-infoclass-dump";
  static const String diskStoryPreviewKey = "pawprint-storypreviewclass-dump";
}
