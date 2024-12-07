import 'package:flutter/material.dart';

class Constants {
  static Color gold = const Color.fromARGB(255, 255, 215, 0);
  static Color darkGold = const Color.fromARGB(255, 239, 203, 2);
  static Color green = Colors.green;
  static Color black = Colors.black;
  static Color red = Colors.red;
  static Color listArticleBlurbColor = const Color.fromARGB(255, 100, 100, 100);
  static Color bottomAppBarColor = const Color.fromARGB(255, 251, 251, 249);
  static Color authorProfilePicBGColor = const Color.fromARGB(255, 230, 230, 224);

  static Size bannerPaintSize = const Size(100, 100);

  static String storyPreviewImageUrlKey = "imgUrl";
  static String storyPreviewTitleKey = "title";
  static String storyPreviewIDKey = "id";
  static String storyPreviewBlurbKey = "blurb";
  static String storyPreviewReadTimeKey = "readTime";
  static String storyPreviewSavedKey = "savedKey";

  static String storyContentKey = "content";
  static String storyAuthorsKey = "authors";
  static String storyMonthKey = "month";
  static String storyYearKey = "year";
  static String storyColumnKey = "column";

  static String authorNameKey = "name";
  static String authorBioKey = "bio";
  static String authorGradYearKey = "gradYear";
  static String authorProfilePicUrl = "picUrl";
  static String authorStoryPreviewKey = "storyIDs";

  static String infoIssueKey = "issue";

  static List<String> columns = [
    "Print Editions",
    "Life",
    "Perspectives",
    "This Issue",
    "World/Politics",
    "Entertainment",
    "Sports",
  ];
  static int columnsPrintEditionsIndex = 0;
  static int columnsLifeIndex = 1;
  static int columnsPerspectivesIndex = 2;
  static int columnsThisIssueIndex = 3;
  static int columnsWorldPoliticsIndex = 4;
  static int columnsEntertainmentIndex = 5;
  static int columnsSportsIndex = 6;

  static String diskInfoKey = "pawprint-infoclass-dump";
  static String diskStoryPreviewKey = "pawprint-storypreviewclass-dump";
}
