import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/widgets/header.dart';
import 'package:myapp/src/widgets/homearticlepreview.dart';
import 'package:myapp/src/widgets/navbar.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text("Recent Stories",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold)
                            .copyWith(fontSize: 40))),
              ],
            ),
            ArticlePreview(stories: [Story(), Story(), Story(), Story()]),
            ElevatedButton(
                onPressed: () {
                  print(Theme.of(context).textTheme.bodySmall?.fontFamily);
                },
                child: Text("helo"))
          ]),
        )));
  }
}
