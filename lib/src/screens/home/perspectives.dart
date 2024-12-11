import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/utils/stories.dart';

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
      ret.add(ListTile(
          title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                storyPreviews[i].title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              )),
          subtitle: Column(children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  storyPreviews[i].blurb ?? "",
                  style: TextStyle(fontSize: 15, color: Constants.listArticleBlurbColor),
                )),
            storyPreviews[i].readTime != null ? const SizedBox(height: 10) : const SizedBox.shrink(),
            Align(
                alignment: Alignment.bottomRight,
                child: storyPreviews[i].readTime != null
                    ? RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: (storyPreviews[i].readTime ?? "").toString(),
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
            pushFromPreviewToStory(storyPreviews[i], context);
          }));

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
    print(l);
    setState(() {
      storyPreviews.addAll(l);
    });
  }
}
