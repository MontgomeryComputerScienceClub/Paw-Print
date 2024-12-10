import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/utils/stories.dart';

// https://www.youtube.com/watch?v=Gsfjcpo6wcA
// ignore: must_be_immutable
class Perspectives extends StatefulWidget {
  Perspectives({super.key, required this.stories});

  List<StoryPreview> stories;

  @override
  State<Perspectives> createState() => _PerspectivesState();
}

class _PerspectivesState extends State<Perspectives> {
  ScrollController scrollController = ScrollController();
  int page = 0;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  List<Widget> _generateChildren() {
    List<Widget> ret = [];
    ret.add(const SizedBox(height: 10));
    for (int i = 0; i < widget.stories.length; i++) {
      if (i == 0) {
        ret.add(InkWell(
            onTap: () {
              pushFromPreviewToStory(widget.stories[i], context);
            },
            child: SizedBox(width: MediaQuery.of(context).size.width, child: widget.stories[i].getImageWidget())));
      }
      ret.add(ListTile(
          title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                widget.stories[i].title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              )),
          subtitle: Column(children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.stories[i].blurb ?? "",
                  style: TextStyle(fontSize: 15, color: Constants.listArticleBlurbColor),
                )),
            widget.stories[i].readTime != null ? const SizedBox(height: 10) : const SizedBox.shrink(),
            Align(
                alignment: Alignment.bottomRight,
                child: widget.stories[i].readTime != null
                    ? RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: (widget.stories[i].readTime ?? "").toString(),
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
            pushFromPreviewToStory(widget.stories[i], context);
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
      itemBuilder: (context, index) {
        if (isLoadingMore && index == e.length) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return e[index];
      },
      itemCount: isLoadingMore ? e.length : e.length,
    ));
  }

  Future<void> _scrollListener() async {
    if (isLoadingMore) return;
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
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
    //TODO: just add to the widget.stories variable...
  }
}
