import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/widgets/preview_cell.dart';

class MultiArticlePreview extends StatefulWidget {
  const MultiArticlePreview(
      {super.key,
      required this.stories,
      required this.column,
      required this.type,
      required this.previewLength});

  final int type;
  final List<StoryPreview> stories;
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
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "View More on ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    widget.column,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        color: Constants.green,
                        fontWeight: FontWeight.bold),
                  )
                ]))));

    return ret;
  }

  List<Widget> typeOne() {
    List<Widget> ret = [];
    List<StoryPreview> forViewMore = [];
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
    List<StoryPreview> forViewMore = [];
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

class HomePagePreview extends StatefulWidget {
  const HomePagePreview({super.key, required this.stories});

  final List<StoryPreview> stories;

  @override
  State<HomePagePreview> createState() => _HomePagePreviewState();
}

class _HomePagePreviewState extends State<HomePagePreview> {
  List<Widget> generateContent() {
    List<Widget> ret = [];
    for (int i = 0; i < widget.stories.length; i++) {
      if (i == 0) {
        ret.add(HomeArticleFirstPreviewCell(
          s: widget.stories[i],
        ));
      } else if (i < 4) {
        ret.add(HomeArticleRestPreviewCell(
          s: widget.stories[i],
        ));
      }
    }
    ret.add(Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {},
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //TODO: view more page probbaly shouold be part of listarticles
                  const Text(
                    "View More ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    "Featured",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        color: Constants.green,
                        fontWeight: FontWeight.bold),
                  )
                ]))));

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
            shadowColor: Colors.transparent,
            color: const Color.fromARGB(255, 243, 242, 242),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: generateContent())));
  }
}
