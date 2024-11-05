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
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 150, child: s.getImageWidget()),
                  Text(s.title),
                ],
              ),
            )));
  }
}

class ArticlePreviewRow extends StatelessWidget {
  const ArticlePreviewRow({super.key, required this.s});

  final Story s;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
            surfaceTintColor: Colors.transparent,
            color: Colors.white70,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(s.title),
                  SizedBox(height: 150, child: s.getImageWidget()),
                ],
              ),
            )));
  }
}
