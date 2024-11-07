// ignore: file_names
import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/painters/painter.dart';
import 'package:myapp/src/routes/noanimation.dart';
import 'package:myapp/src/screens/article/entirearticle.dart';

class ArticlePreviewCell extends StatelessWidget {
  const ArticlePreviewCell({super.key, required this.s, required this.index});

  final Story s;
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
                  index == 0
                      ? Positioned(
                          top: 0,
                          left: 0,
                          child: CustomPaint(
                            size: Size(100, 100),
                            painter: ArticlePreviewCellBanner(),
                          ))
                      : const SizedBox.shrink(),
                  Column(
                    children: [
                      SizedBox(height: 150, child: s.getImageWidget()),
                      Text(s.title),
                    ],
                  ),
                ]))));
  }
}

class ArticlePreviewRow extends StatelessWidget {
  const ArticlePreviewRow({super.key, required this.s, required this.index});

  final Story s;
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
                  index == 0
                      ? Positioned(
                          top: 0,
                          left: 0,
                          child: CustomPaint(
                            size: Size(100, 100),
                            painter: ArticlePreviewRowBanner(),
                          ))
                      : const SizedBox.shrink(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(s.title),
                      SizedBox(height: 150, child: s.getImageWidget()),
                    ],
                  ),
                ]))));
  }
}

class HomeArticleFirstPreviewCell extends StatelessWidget {
  const HomeArticleFirstPreviewCell({super.key, required this.s});

  final Story s;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top: 10,
              left: 10,
              child: CustomPaint(
                size: Size(100, 100),
                painter: ArticleFirstPreviewCellBanner(),
              )),
          Column(children: [
            SizedBox(height: 200, child: s.getImageWidget()),
            ListTile(
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () async {
                    Navigator.of(context).push(NoAnimationRoute(
                        child: EntireArticlePage(
                      main: s,
                      relatedStories: [],
                    )));
                  },
                ),
                title: Text(s.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold, height: 1.2))),
          ])
        ],
      ),
    );
  }
}

class HomeArticleRestPreviewCell extends StatelessWidget {
  const HomeArticleRestPreviewCell({super.key, required this.s});

  final Story s;

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
