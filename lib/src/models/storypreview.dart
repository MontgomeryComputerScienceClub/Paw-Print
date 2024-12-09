import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/models/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryPreview {
  String title;
  String? imageUrl;
  int id;
  String? blurb;
  int? readTime;

  StoryPreview({required this.title, this.imageUrl, required this.id, this.blurb, this.readTime});

  factory StoryPreview.fromJson(Map<String, dynamic> json) {
    return StoryPreview(
        id: json[Constants.storyPreviewIDKey],
        imageUrl: json[Constants.storyPreviewImageUrlKey],
        title: json[Constants.storyPreviewTitleKey],
        blurb: json[Constants.storyPreviewBlurbKey],
        readTime: json[Constants.storyPreviewReadTimeKey]);
  }

  Map<String, dynamic> toJson() {
    return {
      Constants.storyPreviewBlurbKey: blurb,
      Constants.storyPreviewImageUrlKey: imageUrl,
      Constants.storyPreviewIDKey: id,
      Constants.storyPreviewReadTimeKey: readTime,
      Constants.storyPreviewTitleKey: title,
    };
  }

  Future<bool> isSaved() async {
    List<StoryPreview> previews = await fromDisk();
    for (StoryPreview preview in previews) {
      if (preview.id == id) {
        return true;
      }
    }
    return false;
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

  Future<void> toDisk() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedStories = prefs.getStringList(Constants.diskStoryPreviewKey) ?? [];
    savedStories.add(jsonEncode(toJson()));
    prefs.setStringList(Constants.diskStoryPreviewKey, savedStories);
  }

  //TODO: try to implement Cached network image  with cached image network library
  Widget getImageWidget() {
    if (imageUrl == null) {
      return Image.asset("assets/paw.png");
    }
    return Image.network(
      imageUrl ?? "",
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

  Future<Story> getStoryFromPreview() async {
    //TODO: implement story getting logic
    print(id);
    if (id == 696) {
      return defaultStory;
    } else {
      return defaultStory2;
    }
  }
}
