import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/widgets/previewCell.dart';

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
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "View More ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                  Text(
                    "Recents",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Constants.green, fontWeight: FontWeight.bold),
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
