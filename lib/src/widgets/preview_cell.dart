// ignore: file_names
import 'package:flutter/material.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/models/test.dart';
import 'package:myapp/src/painters/painter.dart';
import 'package:myapp/src/routes/noanimation.dart';
import 'package:myapp/src/screens/article/entirearticle.dart';

class ArticlePreviewCell extends StatelessWidget {
  const ArticlePreviewCell({super.key, required this.s, required this.index});

  final StoryPreview s;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
            surfaceTintColor: Colors.transparent,
            color: Colors.white70,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Stack(children: [
                  Column(
                    children: [
                      SizedBox(
                          height: 150, width: 150, child: s.getImageWidget()),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        s.title,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  index == 0
                      ? Positioned(
                          top: 0,
                          left: 0,
                          child: CustomPaint(
                            size: Size(100, 100),
                            painter: ArticlePreviewCellBanner(),
                          ))
                      : const SizedBox.shrink(),
                ]))));
  }
}

class ArticlePreviewRow extends StatelessWidget {
  const ArticlePreviewRow({super.key, required this.s, required this.index});

  final StoryPreview s;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
            surfaceTintColor: Colors.transparent,
            color: Colors.white70,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Stack(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 120,
                          child: Text(
                            s.title,
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                          height: 150, width: 150, child: s.getImageWidget()),
                    ],
                  ),
                  index == 0
                      ? Positioned(
                          top: 0,
                          left: 0,
                          child: CustomPaint(
                            size: Size(100, 100),
                            painter: ArticlePreviewRowBanner(),
                          ))
                      : const SizedBox.shrink(),
                ]))));
  }
}

class HomeArticleFirstPreviewCell extends StatelessWidget {
  const HomeArticleFirstPreviewCell({super.key, required this.s});

  final StoryPreview s;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(children: [
            SizedBox(height: 200, width: 275, child: s.getImageWidget()),
            SizedBox(height: 10),
            ListTile(
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () async {
                    //TODO: Modify this to not delay and also get related stories
                    Future.delayed(const Duration(milliseconds: 100), () async {
                      Navigator.of(context).push(NoAnimationRoute(
                          child: EntireArticlePage(
                        main: await s.getStoryFromPreview(),
                        relatedStories: [],
                      )));
                    });
                  },
                ),
                title: Text(s.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold, height: 1.2))),
          ]),
          Positioned(
              top: 10,
              left: 10,
              child: CustomPaint(
                size: Size(100, 100),
                painter: ArticleFirstPreviewCellBanner(),
              )),
        ],
      ),
    );
  }
}

class HomeArticleRestPreviewCell extends StatelessWidget {
  const HomeArticleRestPreviewCell({super.key, required this.s});

  final StoryPreview s;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(s.title),
      subtitle: Text("Learn more about the story here"),
      trailing: IconButton(
        icon: Icon(Icons.open_in_new),
        onPressed: () {},
      ),
    );
  }
}
