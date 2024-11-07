import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/widgets/previewCell.dart';

class MultiArticlePreview extends StatefulWidget {
  const MultiArticlePreview(
      {super.key,
      required this.stories,
      required this.column,
      required this.type,
      required this.previewLength});

  final int type;
  final List<Story> stories;
  final String column;
  final int previewLength;

  @override
  State<MultiArticlePreview> createState() => _State();
}

class _State extends State<MultiArticlePreview> {
  List<Widget> returnContent() {
    List<Widget> ret = [];

    switch (widget.type) {
      case 1:
        ret = typeOne();
      case 2:
        ret = typeTwo();
    }

    ret.add(Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {},
            child: Text(
              "View More on ${widget.column}",
              style: TextStyle(fontSize: 12),
            ))));

    return ret;
  }

  List<Widget> typeOne() {
    List<Widget> ret = [];
    List<Story> forViewMore = [];
    for (int i = 0; i < widget.stories.length; i++) {
      if (i < widget.previewLength) {
        if (i % 2 == 1) {
          ret.add(Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArticlePreviewCell(s: widget.stories[i - 1], index: i - 1),
              ArticlePreviewCell(s: widget.stories[i], index: i),
            ],
          ));
        } else if (i == widget.previewLength - 1) {
          ret.add(Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArticlePreviewRow(s: widget.stories[i], index: i),
            ],
          ));
        }
      } else {
        forViewMore.add(widget.stories[i]);
      }
    }

    return ret;
  }

  List<Widget> typeTwo() {
    List<Widget> ret = [];
    List<Story> forViewMore = [];
    for (int i = 0; i < widget.stories.length; i++) {
      if (i == 0) {
        ret.add(Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArticlePreviewRow(s: widget.stories[i], index: i),
          ],
        ));
      } else if (i < widget.previewLength) {
        if (i % 2 == 0) {
          ret.add(Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArticlePreviewCell(s: widget.stories[i - 1], index: i - 1),
              ArticlePreviewCell(s: widget.stories[i], index: i),
            ],
          ));
        } else if (i == widget.previewLength - 1) {
          ret.add(Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArticlePreviewRow(s: widget.stories[i], index: i),
            ],
          ));
        }
      } else {
        forViewMore.add(widget.stories[i]);
      }
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: returnContent()));
  }
}
