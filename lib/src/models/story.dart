import 'package:flutter/material.dart';

class Story {
  String title;
  String imageUrl;
  // double unweighted;
  // double weighted;
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
  // Gpa({required this.unweighted, required this.weighted});

  // Map<String, dynamic> toJson() {
  //   return {
  //     'unweighted': unweighted,
  //     'weighted': weighted,
  //   };
  // }

  // factory Gpa.fromJson(Map<String, dynamic> json) {
  //   return Gpa(
  //     unweighted: json['unweighted'].toDouble(),
  //     weighted: json['weighted'].toDouble(),
  //   );
  // }

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Gpa &&
  //         runtimeType == other.runtimeType &&
  //         unweighted == other.unweighted &&
  //         weighted == other.weighted;

  // @override
  // int get hashCode => unweighted.hashCode ^ weighted.hashCode;
}
