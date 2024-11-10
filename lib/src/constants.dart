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
  static String storyPreviewBlurbKey = "blurb";

  static String storyContentKey = "content";
  static String storyAuthorsKey = "authors";
  static String storyMonthKey = "month";
  static String storyYearKey = "year";
  static String storyColumnKey = "column";

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
}
