import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';

class MultiArticlePreview extends StatefulWidget {
  const MultiArticlePreview({super.key, required this.stories, required this.column});

  final List<Story> stories;
  final String column;

  @override
  State<MultiArticlePreview> createState() => _State();
}

class _State extends State<MultiArticlePreview> {
  List<Widget> genContentTypeOne() {
    List<Widget> ret = [];
    List<Widget> selected = [];
    List<Story> forViewMore = [];
    for (int i = 0; i < widget.stories.length; i++) {
      if (i < 6) {
        if (i % 2 == 1) {
          ret.add(Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Card(
                child: Column(
                  children: [
                    Text(widget.stories[i].title),
                  ],
                ),
              )),
              Expanded(
                  child: Card(
                child: Column(
                  children: [
                    Text(widget.stories[i - 1].title),
                  ],
                ),
              )),
            ],
          ));
        } else if (i == widget.stories.length) {}
        // ret.add(const Card(
        //     child: Column(
        //   children: [Text("hi")],
        // )));
      } else {
        forViewMore.add(widget.stories.first);
      }
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
                      children: genContentTypeOne()))))
    ]);
  }
}
