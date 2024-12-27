import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/providers/storypreview_provider.dart';
import 'package:myapp/src/widgets/preview_cell.dart';

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
          ImageBackgroundPreviewCell(imageWidth: MediaQuery.sizeOf(context).width / 2.15, preview: storyPreviews[i]));
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
    List<StoryPreview> l = await StoryPreviewProvider.getStoriesFromColumn(page, column);
    setState(() {
      storyPreviews.addAll(l);
    });
  }
}
