// ignore: file_names
import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';

class ArticlePreviewCell extends StatelessWidget {
  const ArticlePreviewCell({super.key, required this.s});

  final Story s;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      surfaceTintColor: Colors.transparent,
      color: Colors.white70,
      child: Column(
        children: [
          s.getImageWidget(),
          Text(s.title),
        ],
      ),
    ));
  }
}
