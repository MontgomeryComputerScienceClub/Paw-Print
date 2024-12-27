import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/painters/painter.dart';
import 'package:myapp/src/utils/stories.dart';
import 'package:wave_blob/wave_blob.dart';

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
            child: InkWell(
                onTap: () => pushFromPreviewToStory(s, context),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Stack(children: [
                      Column(
                        children: [
                          SizedBox(height: 150, width: 150, child: s.getImageWidget()),
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
                                size: Constants.bannerPaintSize,
                                painter: ArticlePreviewCellBanner(),
                              ))
                          : const SizedBox.shrink(),
                    ])))));
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
            child: InkWell(
                onTap: () => pushFromPreviewToStory(s, context),
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
                          SizedBox(height: 150, width: 150, child: s.getImageWidget()),
                        ],
                      ),
                      index == 0
                          ? Positioned(
                              top: 0,
                              left: 0,
                              child: CustomPaint(
                                size: Constants.bannerPaintSize,
                                painter: ArticlePreviewRowBanner(),
                              ))
                          : const SizedBox.shrink(),
                    ])))));
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
                  onPressed: () {
                    pushFromPreviewToStory(s, context);
                  },
                ),
                title: Text(s.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold, height: 1.2, fontSize: 30))),
          ]),
          Positioned(
              top: 10,
              left: 10,
              child: CustomPaint(
                size: Constants.bannerPaintSize,
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
        onPressed: () {
          pushFromPreviewToStory(s, context);
        },
      ),
    );
  }
}

class PreviewCellWithImage extends StatelessWidget {
  const PreviewCellWithImage({super.key, required this.s});

  final StoryPreview s;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: s.getImageWidget(),
        ),
      ),
      title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            s.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
      subtitle: Text(
        s.blurb ?? "",
        style: TextStyle(fontSize: 15, color: Constants.listArticleBlurbColor, height: 1.4),
      ),
      onTap: () {
        pushFromPreviewToStory(s, context);
      },
    );
  }
}

class PreviewCellWithReadTime extends StatelessWidget {
  const PreviewCellWithReadTime({super.key, required this.s});
  final StoryPreview s;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              s.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            )),
        subtitle: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                s.blurb ?? "",
                style: TextStyle(fontSize: 15, color: Constants.listArticleBlurbColor),
              )),
          s.readTime != null ? const SizedBox(height: 10) : const SizedBox.shrink(),
          Align(
              alignment: Alignment.bottomRight,
              child: s.readTime != null
                  ? RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: (s.readTime ?? "").toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 13, color: Constants.green, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: " min read", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 13)),
                      ]),
                    )
                  : const SizedBox.shrink()),
        ]),
        onTap: () {
          pushFromPreviewToStory(s, context);
        });
  }
}

class PreviewCellWithImageInShape extends StatefulWidget {
  const PreviewCellWithImageInShape({super.key, required this.s, required this.left});

  final StoryPreview s;
  final bool left;

  @override
  State<PreviewCellWithImageInShape> createState() => _PreviewCellWithImageInShapeState();
}

class _PreviewCellWithImageInShapeState extends State<PreviewCellWithImageInShape> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer.periodic(const Duration(milliseconds: 50), (timer) {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.left
          ? SizedBox(
              height: Constants.worldPoliticsBlobSize.height,
              width: Constants.worldPoliticsBlobSize.width,
              child: WaveBlob(
                  scale: 2,
                  amplitude: 7500,
                  colors: [Constants.green, Constants.green],
                  child: widget.s.getImageWidget()))
          : null,
      trailing: widget.left
          ? null
          : SizedBox(
              height: Constants.worldPoliticsBlobSize.height,
              width: Constants.worldPoliticsBlobSize.width,
              child: WaveBlob(
                  scale: 2,
                  amplitude: 7500,
                  colors: [Constants.gold, Constants.gold],
                  child: widget.s.getImageWidget())),
      title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            widget.s.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
      subtitle: Text(
        widget.s.blurb ?? "",
        style: TextStyle(fontSize: 15, color: Constants.listArticleBlurbColor, height: 1.4),
      ),
      onTap: () {
        pushFromPreviewToStory(widget.s, context);
      },
    );
  }
}

class ImageBackgroundPreviewCell extends StatelessWidget {
  const ImageBackgroundPreviewCell({super.key, required this.preview, required this.imageWidth});

  final StoryPreview preview;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Constants.lifePreviewBackgroundColor,
        child: GestureDetector(
          onTap: () {
            pushFromPreviewToStory(preview, context);
          },
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                right: 10,
                child: SizedBox(width: imageWidth, child: preview.getImageWidget()),
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "${preview.title} >",
                      // style: TextStyle(color: Colors.grey.shade300),
                    ),
                  )),
            ],
          ),
        ));
  }
}
