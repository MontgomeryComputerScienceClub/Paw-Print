import 'package:flutter/material.dart';
import 'package:myapp/src/models/storypreview.dart';

class Perspectives extends StatefulWidget {
  const Perspectives({super.key, required this.stories});

  final List<StoryPreview> stories;

  @override
  State<Perspectives> createState() => _PerspectivesState();
}

class _PerspectivesState extends State<Perspectives> {
  List<Widget> _generateChildren() {
    List<Widget> ret = [];
    ret.add(const SizedBox(height: 10));
    for (int i = 0; i < widget.stories.length; i++) {
      //todo generate stuff like NYT hahahah
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: _generateChildren())));
  }
}
