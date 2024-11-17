import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/routes/noanimation.dart';
import 'package:myapp/src/screens/article/entirearticle.dart';

class Perspectives extends StatefulWidget {
  const Perspectives({super.key, required this.stories});

  final List<StoryPreview> stories;

  @override
  State<Perspectives> createState() => _PerspectivesState();
}

class _PerspectivesState extends State<Perspectives> {
  List<Widget> _generateChildren() {
    List<Widget> ret = [];
    ret.add(const SizedBox(height: 10));
    for (int i = 0; i < widget.stories.length; i++) {
      if (i == 0) {
        ret.add(SizedBox(width: MediaQuery.of(context).size.width, child: widget.stories[i].getImageWidget()));
      }
      ret.add(ListTile(
        title: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              widget.stories[i].title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            )),
        subtitle: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.stories[i].blurb ?? "",
                style: TextStyle(fontSize: 15, color: Constants.listArticleBlurbColor),
              )),
          widget.stories[i].readTime != null ? const SizedBox(height: 10) : const SizedBox.shrink(),
          Align(
              alignment: Alignment.bottomRight,
              child: widget.stories[i].readTime != null
                  ? Row(mainAxisAlignment: MainAxisAlignment.end, mainAxisSize: MainAxisSize.min, children: [
                      Text((widget.stories[i].readTime ?? "").toString(),
                          style: TextStyle(fontSize: 13, color: Constants.green, fontWeight: FontWeight.bold)),
                      const Text(" min read", style: TextStyle(fontSize: 13)),
                    ])
                  : const SizedBox.shrink()),
        ]),
        onTap: () async {
          //TODO: modify this and the one in preview cell to actually get the story
          var story = await widget.stories[i].getStoryFromPreview();

          Navigator.of(context).push(NoAnimationRoute(
              child: EntireArticlePage(
            main: story,
            relatedStories: [],
          )));
        },
      ));

      ret.add(const Divider());
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            //TODO: implement scroll down update logic -> should query first 10 and then append children
            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: _generateChildren())));
  }
}
