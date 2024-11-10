import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/test.dart';
import 'package:myapp/src/widgets/headers/columns.dart';
import 'package:myapp/src/widgets/preview_groups.dart';
import 'package:myapp/src/widgets/headers/header.dart';
import 'package:myapp/src/widgets/navbar.dart';

import '../../widgets/sectionheader.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Header(
          implyleading: false,
          includeSearch: true,
        ),
        bottomNavigationBar: const Navbar(
          selectedIndex: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Divider(),
            Columns(
              selectedIndex: Constants.columnsThisIssueIndex,
            ),
            const Divider(),
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
        )));
  }
}
