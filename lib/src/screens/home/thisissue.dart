import 'package:flutter/material.dart';
import 'package:myapp/src/models/test.dart';
import 'package:myapp/src/widgets/preview_groups.dart';
import 'package:myapp/src/widgets/sectionheader.dart';

class ThisIssue extends StatefulWidget {
  const ThisIssue({super.key});

  @override
  State<ThisIssue> createState() => _ThisIssueState();
}

class _ThisIssueState extends State<ThisIssue> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        //  const Divider(),
        const SizedBox(height: 10),
        const StoryHeader(
          text: "Featured",
        ),
        HomePagePreview(stories: [
          previewStory2,
          previewStory,
          previewStory,
          previewStory2,
        ]),
        const StoryHeader(
          text: "Life",
        ),
        MultiArticlePreview(
            previewLength: 3,
            type: 1,
            column: "Life",
            stories: [
              previewStory,
              previewStory2,
              previewStory,
              previewStory2,
              previewStory,
              previewStory2,
            ]),
        const StoryHeader(
          text: 'Perspectives',
        ),
        MultiArticlePreview(
            previewLength: 1,
            type: 2,
            column: "Life",
            stories: [
              previewStory,
              previewStory2,
              previewStory,
            ]),
        const StoryHeader(
          text: 'World/Politics',
        ),
        const StoryHeader(
          text: 'Entertainment',
        ),
        const StoryHeader(
          text: 'Sports',
        ),
        // ElevatedButton(
        //     onPressed: () {
        //       print(Theme.of(context).textTheme.bodySmall?.fontFamily);
        //     },
        //     child: Text("helo"))
      ]),
    ));
  }
}
