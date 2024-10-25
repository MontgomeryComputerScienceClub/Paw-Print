import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';

class ArticlePreview extends StatefulWidget {
  const ArticlePreview({super.key, required this.stories});

  final List<Story> stories;

  @override
  State<ArticlePreview> createState() => _ArticlePreviewState();
}

class _ArticlePreviewState extends State<ArticlePreview> {
  List<Widget> generateContent() {
    List<Widget> ret = [];
    for (int i = 0; i < widget.stories.length; i++) {
      Story s = widget.stories[i];
      if (i == 0) {
        ret.add(Container(
          width: 300,
          height: 300,
          color: Colors.red,
        ));
      }
      if (i < 4) {
        ret.add(const ListTile(
          title: Text("Hello"),
        ));
      }
    }
    ret.add(Center(
        child: TextButton(
            onPressed: () {},
            child: const Text(
              "View More",
              style: TextStyle(fontSize: 12),
            ))));

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Card(
              surfaceTintColor: Colors.white,
              shadowColor: Colors.transparent,
              color: Colors.transparent,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: generateContent()))))
    ]);
  }
}
