import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/screens/home/previewCell.dart';

class HomePagePreview extends StatefulWidget {
  const HomePagePreview({super.key, required this.stories});

  final List<Story> stories;

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
            child: const Text(
              "View More Recents",
              style: TextStyle(fontSize: 12),
            ))));

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Card(
              shadowColor: Colors.transparent,
              color: Colors.white70,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: generateContent()))))
    ]);
  }
}
