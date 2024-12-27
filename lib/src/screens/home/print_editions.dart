import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/providers/storypreview_provider.dart';
import 'package:myapp/src/widgets/preview_cell.dart';

//TODO: create UI for print editions
class PrintEditions extends StatefulWidget {
  const PrintEditions({super.key});

  @override
  State<PrintEditions> createState() => _PrintEditionsState();
}

class _PrintEditionsState extends State<PrintEditions> {
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
    if (storyPreviews.isNotEmpty) {
      ret.add(FirstImageInPreviewList(s: storyPreviews.first, animate: false));
    }
    for (int i = 0; i < storyPreviews.length; i++) {
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
