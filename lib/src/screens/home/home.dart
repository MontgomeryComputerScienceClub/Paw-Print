import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';
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
              Story(
                title: "Trump wins presidency",
                imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png",
              ),
              Story(title: "Story 2", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 3", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 4", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
            ]),
            const StoryHeader(
              text: "Life",
            ),
            MultiArticlePreview(previewLength: 3, type: 1, column: "Life", stories: [
              Story(title: "Story 1", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 2", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 3", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 4", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
              Story(title: "Story 5", imageUrl: "https://thespokesman.net/wp-content/uploads/2024/05/class.png"),
            ]),
            const StoryHeader(
              text: 'Perspectives',
            ),
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
