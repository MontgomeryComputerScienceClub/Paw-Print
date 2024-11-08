import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/models/test.dart';
import 'package:myapp/src/widgets/multipreview.dart';
import 'package:myapp/src/widgets/header.dart';
import 'package:myapp/src/widgets/frontpreview.dart';
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
        ),
        bottomNavigationBar: const Navbar(
          selectedIndex: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Divider(),
            const StoryHeader(
              text: "Recent Stories",
            ),
            HomePagePreview(stories: [
              defaultStory,
              defaultStory2,
              defaultStory2,
              defaultStory2,
            ]),
            const StoryHeader(
              text: "Life",
            ),
            MultiArticlePreview(
                previewLength: 3,
                type: 1,
                column: "Life",
                stories: [
                  defaultStory,
                  defaultStory2,
                  defaultStory,
                  defaultStory2,
                  defaultStory,
                  defaultStory2,
                ]),
            const StoryHeader(
              text: 'Perspectives',
            ),
            MultiArticlePreview(
                previewLength: 1,
                type: 2,
                column: "Life",
                stories: [
                  defaultStory,
                  defaultStory2,
                  defaultStory,
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
            ElevatedButton(
                onPressed: () {
                  print(Theme.of(context).textTheme.bodySmall?.fontFamily);
                },
                child: Text("helo"))
          ]),
        )));
  }
}
