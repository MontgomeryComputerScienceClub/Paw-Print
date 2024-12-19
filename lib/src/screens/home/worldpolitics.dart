import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/widgets/preview_cell.dart';

class WorldPolitics extends StatefulWidget {
  const WorldPolitics({super.key});

  @override
  State<WorldPolitics> createState() => _WorldPoliticsState();
}

class _WorldPoliticsState extends State<WorldPolitics> {
  final String column = Constants.columns[Constants.columnsWorldPoliticsIndex];

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

  List<Widget> _generateChildren() {
    List<Widget> ret = [];

    for (int i = 0; i < storyPreviews.length; i++) {
      ret.add(PreviewCellWithImageInShape(s: storyPreviews[i], left: i % 2 == 1));
      ret.add(const Divider());
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    var e = _generateChildren();
    return SafeArea(
        child: ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        return e[index];
      },
      itemCount: e.length,
    ));
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
    setState(() {
      storyPreviews.addAll(l);
    });
  }
}
