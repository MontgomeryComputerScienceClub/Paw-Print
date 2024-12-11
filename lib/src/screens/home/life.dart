import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/utils/stories.dart';

class Life extends StatefulWidget {
  const Life({super.key});

  @override
  State<Life> createState() => _LifeState();
}

class _LifeState extends State<Life> {
  final String column = Constants.columns[Constants.columnsLifeIndex];

  ScrollController scrollController = ScrollController();
  int page = 0;
  bool isLoadingMore = false;
  List<StoryPreview> storyPreviews = [];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    fetchArticles();
  }

  List<Widget> _genChildren() {
    List<Widget> ret = [];
    for (int i = 0; i < storyPreviews.length; i++) {
      ret.add(
        Container(
            color: Constants.lifePreviewBackgroundColor,
            child: GestureDetector(
              onTap: () {
                pushFromPreviewToStory(storyPreviews[i], context);
              },
              child: Stack(
                children: [
                  Positioned(
                      top: 10,
                      left: 10,
                      right: 10,
                      child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.15, child: storyPreviews[i].getImageWidget())),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "${storyPreviews[i].title} >",
                          // style: TextStyle(color: Colors.grey.shade300),
                        ),
                      )),
                ],
              ),
            )),
      );
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GridView.count(
            controller: scrollController,
            crossAxisCount: 2,
            childAspectRatio: (1 / 1.2),
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            padding: EdgeInsets.zero,
            children: _genChildren()));
  }

  Future<void> _scrollListener() async {
    if (isLoadingMore) return;
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200) {
      setState(() {
        isLoadingMore = true;
      });
      page = page + 1;
      await fetchArticles();
      setState(() {
        isLoadingMore = false;
      });
    }
  }

  Future<void> fetchArticles() async {
    List<StoryPreview> l = await StoryPreview.getStoriesFromColumn(page, column);
    print(l);
    setState(() {
      storyPreviews.addAll(l);
    });
  }
}
