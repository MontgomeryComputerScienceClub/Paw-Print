import 'package:flutter/material.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/widgets/headers/header.dart';
import 'package:myapp/src/widgets/navbar.dart';
import 'package:myapp/src/widgets/preview_cell.dart';

// ignore: must_be_immutable
class UserPage extends StatefulWidget {
  UserPage({super.key, required this.previews});

  List<StoryPreview> previews;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> _genSavedStories(BuildContext context) {
    List<Widget> ret = [];
    for (StoryPreview prev in widget.previews) {
      ret.add(Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: ImagedPreviewCell(s: prev)));
    }
    return ret;
  }

  List<Widget> _genBody(BuildContext context) {
    List<Widget> ret = [
      const Divider(),
      const SizedBox(height: 10),
      Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Your Saved Stories",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
          )),
    ];

    ret.addAll(_genSavedStories(context));

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              StoryPreview.clearDisk();
            },
            child: const Icon(Icons.delete)),
        appBar: const Header(
          implyleading: false,
          includeSearch: false,
          includeColumns: false,
        ),
        bottomNavigationBar: const Navbar(
          selectedIndex: 2,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _genBody(context)),
        )));
  }
}
