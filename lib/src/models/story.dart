import 'package:flutter/material.dart';

class Story {
  String title;
  String imageUrl;

  Story({required this.title, required this.imageUrl});

  Widget getImageWidget() {
    return Image.network(
      imageUrl,
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
        return const Icon(Icons.error); // Display an error icon if the image fails to load
      },
    );
  }
}
