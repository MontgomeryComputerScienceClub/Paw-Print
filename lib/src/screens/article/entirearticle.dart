import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/author.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/painters/painter.dart';
import 'package:myapp/src/routes/noanimation.dart';
import 'package:myapp/src/screens/profiles/authorpage.dart';
import 'package:myapp/src/widgets/headers/bottom.dart';
import 'package:intl/intl.dart';
import 'package:myapp/src/widgets/preview_cell.dart';

class EntireArticlePage extends StatefulWidget {
  const EntireArticlePage({super.key, required this.main, required this.relatedStories});

  final Story main;
  final List<Story> relatedStories;

  @override
  State<EntireArticlePage> createState() => _EntireArticlePageState();
}

class _EntireArticlePageState extends State<EntireArticlePage> {
  final ScrollController _scrollController = ScrollController();
  bool showBtmAppBr = true;

  TapGestureRecognizer _pushToAuthorPage(Author a) {
    return TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).push(NoAnimationRoute(
            child: AuthorDisplayScreen(
          author: a,
        )));
      };
  }

  List<TextSpan> _formatAuthorsLinkStyle(List<Author> authors) {
    List<TextSpan> ret = [];
    ret.add(
      TextSpan(
        text: "By ",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );

    if (authors.isEmpty) {
      return [];
    } else if (authors.length == 1) {
      ret.add(
        TextSpan(
          text: authors[0].toString(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Constants.black,
                decoration: TextDecoration.underline,
              ),
          recognizer: _pushToAuthorPage(authors[0]),
        ),
      );
    } else if (authors.length == 2) {
      ret.add(
        TextSpan(
          text: authors[0].toString(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Constants.black,
                decoration: TextDecoration.underline,
              ),
          recognizer: _pushToAuthorPage(authors[0]),
        ),
      );
      ret.add(
        TextSpan(text: " and ", style: Theme.of(context).textTheme.bodyMedium),
      );
      ret.add(
        TextSpan(
          text: authors[1].toString(),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Constants.black,
                decoration: TextDecoration.underline,
              ),
          recognizer: _pushToAuthorPage(authors[1]),
        ),
      );
    } else {
      for (Author author in authors.sublist(0, authors.length - 1)) {
        ret.add(
          TextSpan(
            text: author.toString(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Constants.black,
                  decoration: TextDecoration.underline,
                ),
            recognizer: _pushToAuthorPage(author),
          ),
        );
        ret.add(
          TextSpan(text: ", ", style: Theme.of(context).textTheme.bodyMedium),
        );
      }
      ret.add(
        TextSpan(text: "and ", style: Theme.of(context).textTheme.bodyMedium),
      );
      ret.add(
        TextSpan(
            text: authors.last.toString(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Constants.black,
                  decoration: TextDecoration.underline,
                ),
            recognizer: _pushToAuthorPage(authors.last)),
      );
    }

    return ret;
  }

  String _formatMonthYear(int month, int year) {
    final date = DateTime(year, month);
    return DateFormat.yMMMM().format(date);
  }

  String _processContent(String content) {
    String ret = "";
    ret = content.replaceAll("\n", "\n\n");
    return ret;
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              controller: _scrollController,
              child: Stack(clipBehavior: Clip.none, children: [
                Align(
                    alignment: Alignment.topRight,
                    child: CustomPaint(size: Constants.bannerPaintSize, painter: EntireArticleBanner())),
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const SizedBox(height: 10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          widget.main.titleImageAndID.title,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      )),
                  const SizedBox(height: 10),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          widget.main.titleImageAndID.blurb ?? "",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )),
                  const SizedBox(height: 10),
                  SizedBox(height: 200, child: widget.main.titleImageAndID.getImageWidget()),
                  const Divider(),
                  SizedBox(
                      width: 300,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: _formatAuthorsLinkStyle(widget.main.authors)),
                      )),
                  const SizedBox(height: 8),
                  Text(
                    _formatMonthYear(widget.main.month, widget.main.year),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
                  ),
                  const Divider(),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          _processContent(widget.main.content),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 17),
                        ),
                      )),
                  const SizedBox(height: 10),
                  const Divider(),
                  Text(
                    "Related Articles",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.relatedStories
                                .map((Story story) => Row(children: [
                                      SizedBox(
                                          width: 100,
                                          child: ImageBackgroundPreviewCell(
                                              imageWidth: 50, preview: story.titleImageAndID)),
                                      const SizedBox(width: 5)
                                    ]))
                                .toList())),
                  ),
                  const SizedBox(height: 50),
                ])
              ]))),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(
          milliseconds: 800,
        ),
        curve: Curves.easeInOutSine,
        height: showBtmAppBr ? 100 : 0,
        child: CustomBottomAppBar(linkedStory: widget.main),
      ),
    );
  }
}
