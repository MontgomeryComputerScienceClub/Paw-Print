import 'package:flutter/material.dart';
import 'package:myapp/src/models/storypreview.dart';

class Life extends StatefulWidget {
  const Life({super.key, required this.stories});

  final List<StoryPreview> stories;

  @override
  State<Life> createState() => _LifeState();
}

class _LifeState extends State<Life> {
  _generateChildren() {
    List<Widget> ret = [];

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    var e = _generateChildren();
    return SafeArea(
        //TODO: implement scroll down update logic -> should query first 10 and then append children
        child: ListView.builder(
      itemBuilder: (context, index) {
        return e[index];
      },
      itemCount: e.length,
    ));
  }
}
