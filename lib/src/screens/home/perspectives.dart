import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/providers/storypreview_provider.dart';
import 'package:myapp/src/utils/stories.dart';
import 'package:myapp/src/widgets/preview_cell.dart';

class Perspectives extends StatefulWidget {
  const Perspectives({super.key});

  @override
  State<Perspectives> createState() => _PerspectivesState();
}

class _PerspectivesState extends State<Perspectives> {
  final String column = Constants.columns[Constants.columnsPrintEditionsIndex];

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
    ret.add(const SizedBox(height: 10));
    for (int i = 0; i < storyPreviews.length; i++) {
      if (i == 0) {
        ret.add(InkWell(
            onTap: () {
              pushFromPreviewToStory(storyPreviews[i], context);
            },
            child: SizedBox(width: MediaQuery.of(context).size.width, child: storyPreviews[i].getImageWidget())));
      }
      ret.add(PreviewCellWithReadTime(s: storyPreviews[i]));
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
    List<StoryPreview> l = await StoryPreviewProvider.getStoriesFromColumn(page, column);
    setState(() {
      storyPreviews.addAll(l);
    });
  }
}
