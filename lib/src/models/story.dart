import 'package:flutter/material.dart';

class Story {
  String title;
  String imageUrl;
  int id;
  String content;
  int month;
  int year;
  List<String> authors;

  Story(
      {required this.title,
      required this.imageUrl,
      required this.id,
      required this.content,
      required this.month,
      required this.year,
      required this.authors});

  Widget getImageWidget() {
    return Image.network(
      imageUrl,
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

  factory Story.fromJson(Map<String, dynamic> json) {
    List<String> authors = json["authors"] as List<String>;
    return Story(
      id: json["id"],
      title: json["title"],
      content: json["content"],
      month: json["month"],
      year: json["year"],
      imageUrl: json["img"],
      authors: authors,
    );
  }
}
