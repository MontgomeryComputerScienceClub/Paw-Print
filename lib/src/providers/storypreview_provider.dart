import 'dart:convert';
import 'dart:math';

import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/models/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryPreviewProvider {
  static Future<List<StoryPreview>> getStoriesFromColumn(int page, String column) async {
    List<StoryPreview> ret = [];
    //TODO: call api and use pagination to get columns, sorting by most recent.

    //DEBUG stuff
    int target = Random().nextInt(5);
    for (int i = 0; i < target; i++) {
      if (Random().nextBool()) {
        ret.add(previewStory);
      } else {
        ret.add(previewStory2);
      }
    }

    return ret;
  }

  static void removeIndexFromDisk(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedStories = prefs.getStringList(Constants.diskStoryPreviewKey) ?? [];
    if (savedStories.isNotEmpty && index + 1 <= savedStories.length && index >= 0) {
      savedStories.removeAt(index);
    }
    prefs.setStringList(Constants.diskStoryPreviewKey, savedStories);
  }

  static void clearDisk() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(Constants.diskStoryPreviewKey, []);
  }

  static Future<List<StoryPreview>> fromDisk() async {
    List<StoryPreview> ret = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedStories = prefs.getStringList(Constants.diskStoryPreviewKey) ?? [];
    for (String storyJson in savedStories) {
      ret.add(StoryPreview.fromJson(jsonDecode(storyJson)));
    }
    return ret;
  }
}
