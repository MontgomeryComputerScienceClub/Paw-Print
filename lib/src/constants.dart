import 'package:flutter/material.dart';

class Constants {
  static Color gold = const Color.fromARGB(255, 255, 215, 0);
  static Color darkGold = const Color.fromARGB(255, 239, 203, 2);
  static Color green = Colors.green;
  static Color black = Colors.black;
  static Color red = Colors.red;

  static String storyPreviewImageUrlKey = "imgUrl";
  static String storyPreviewTitleKey = "title";
  static String storyPreviewIDKey = "id";

  static String storyContentKey = "content";
  static String storyAuthorsKey = "authors";
  static String storyMonthKey = "month";
  static String storyYearKey = "year";
  static String storyColumnKey = "column";

  static String infoIssueKey = "issue";

  static List<String> columns = [
    "Life",
    "Perspectives",
    "World/Politics",
    "Entertainment",
    "Sports"
  ];

  static String diskInfoKey = "pawprint-infoclass-dump";
}
