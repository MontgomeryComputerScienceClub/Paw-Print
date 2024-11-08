import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/widgets/header.dart';
import 'package:intl/intl.dart';

class EntireArticlePage extends StatefulWidget {
  const EntireArticlePage({super.key, required this.main, required this.relatedStories});

  final Story main;
  final List<Story> relatedStories;

  @override
  State<EntireArticlePage> createState() => _EntireArticlePageState();
}

class _EntireArticlePageState extends State<EntireArticlePage> {
  String _formatAuthors(List<String> authors) {
    if (authors.isEmpty) return '';
    if (authors.length == 1) return authors[0];
    if (authors.length == 2) return "${authors[0]} and ${authors[1]}";
    return "${authors.sublist(0, authors.length - 1).join(", ")}, and ${authors.last}";
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(
          implyleading: true,
          title: widget.main.title,
          includeSearch: false,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Divider(),
          SizedBox(height: 200, child: widget.main.getImageWidget()),
          const SizedBox(height: 10),
          Text(
            widget.main.title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const Divider(),
          Text("By ${_formatAuthors(widget.main.authors)}", style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 8),
          Text(
            _formatMonthYear(widget.main.month, widget.main.year),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              _processContent(widget.main.content),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15),
            ),
          ),
        ]))));
  }
}
