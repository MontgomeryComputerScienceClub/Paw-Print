// ignore: file_names
import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/painters/painter.dart';

class ArticlePreviewCell extends StatelessWidget {
  const ArticlePreviewCell({super.key, required this.s});

  final Story s;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
            surfaceTintColor: Colors.transparent,
            color: Colors.white70,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 150, child: s.getImageWidget()),
                  Text(s.title),
                ],
              ),
            )));
  }
}

class ArticlePreviewRow extends StatelessWidget {
  const ArticlePreviewRow({super.key, required this.s});

  final Story s;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
            surfaceTintColor: Colors.transparent,
            color: Colors.white70,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(s.title),
                  SizedBox(height: 150, child: s.getImageWidget()),
                ],
              ),
            )));
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
              top: 0,
              left: 0,
              //https://api.flutter.dev/flutter/widgets/CustomPaint-class.html
              child: CustomPaint(
                size: Size(100, 100),
                painter: MyPainter(),
              )),
          Column(children: [
            SizedBox(height: 200, child: s.getImageWidget()),
            ListTile(
                title: Text(s.title,
                    style:
                        Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold, height: 1.2))),
          ])
        ],
        /*
      Positioned(
            top: -20, // Adjust this for the overflow effect
            left: -20, // Adjust this for horizontal overflow
            child: OverflowBox(
              maxWidth: 400, // Adjust width for desired overflow effect
              maxHeight: 300, // Adjust height for desired overflow effect
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: s.getImageWidget(),
              ),
            ),
          ),
        */
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
      trailing: const Icon(Icons.open_in_new),
    );
  }
}
