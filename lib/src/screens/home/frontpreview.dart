import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';

class HomePagePreview extends StatefulWidget {
  const HomePagePreview({super.key, required this.stories});

  final List<Story> stories;

  @override
  State<HomePagePreview> createState() => _HomePagePreviewState();
}

class _HomePagePreviewState extends State<HomePagePreview> {
  List<Widget> generateContent() {
    List<Widget> ret = [];
    for (int i = 0; i < widget.stories.length; i++) {
      //  Story s = widget.stories[i];
      if (i == 0) {
        ret.add(Container(
            height: 300,
            color: Colors.red,
            child: Column(
              children: [
                Container(
                  height: 200,
                  color: Colors.green,
                ),
                const ListTile(
                  title: Text("Hello"),
                )
              ],
            )));
      }
      if (i < 4) {
        ret.add(const ListTile(
          title: Text("The Recent News"),
          subtitle: Text("Learn more"),
          trailing: Icon(Icons.add_box),
        ));
      }
    }
    ret.add(Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {},
            child: const Text(
              "View More Recents",
              style: TextStyle(fontSize: 12),
            ))));

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Card(
              shadowColor: Colors.transparent,
              color: Colors.white70,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: generateContent()))))
    ]);
  }
}
