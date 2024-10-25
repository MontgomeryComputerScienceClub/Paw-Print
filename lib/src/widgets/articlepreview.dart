import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';

class ArticlePreview extends StatefulWidget {
  const ArticlePreview({super.key, required this.stories});

  final List<Story> stories;

  @override
  State<ArticlePreview> createState() => _ArticlePreviewState();
}

class _ArticlePreviewState extends State<ArticlePreview> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
