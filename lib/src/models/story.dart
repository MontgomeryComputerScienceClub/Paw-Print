import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';

class Story {
  StoryPreview titleImageAndID;
  String content;
  int month;
  int year;
  String column;
  List<String> authors;

  Story(
      {required this.titleImageAndID,
      required this.content,
      required this.month,
      required this.year,
      required this.column,
      required this.authors});

  factory Story.fromJson(Map<String, dynamic> json) {
    List<String> authors = json["authors"] as List<String>;

    if (!json.containsKey(Constants.storyPreviewTitleKey) ||
        !json.containsKey(Constants.storyPreviewIDKey)) {
      throw Error();
    }

    return Story(
      titleImageAndID: StoryPreview.fromJson(json),
      column: json[Constants.storyColumnKey],
      content: json[Constants.storyContentKey],
      month: json[Constants.storyMonthKey],
      year: json[Constants.storyYearKey],
      authors: authors,
    );
  }
}
