import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/screens/home/multipreview.dart';
import 'package:myapp/src/widgets/header.dart';
import 'package:myapp/src/screens/home/frontpreview.dart';
import 'package:myapp/src/widgets/navbar.dart';

import 'sectionheader.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Header(),
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
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
            ]),
            const StoryHeader(
              text: "Life",
            ),
            MultiArticlePreview(type: 2, column: "Life", stories: [
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
            ]),
            const StoryHeader(
              text: 'Perspectives',
            ),
            MultiArticlePreview(type: 1, column: "Life", stories: [
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
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
