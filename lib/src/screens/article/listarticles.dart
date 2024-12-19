import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/widgets/preview_cell.dart';

//Used in searches?

class ListArticlesOfCategory extends StatefulWidget {
  const ListArticlesOfCategory({super.key, required this.previews, required this.title});

  final List<StoryPreview> previews;
  final String title;

  @override
  State<ListArticlesOfCategory> createState() => _ListArticlesOfCategoryState();
}

class _ListArticlesOfCategoryState extends State<ListArticlesOfCategory> {
  List<Widget> _buildPreviews(List<StoryPreview> stories) {
    List<Widget> ret = [];
    for (StoryPreview story in stories) {
      ret.add(PreviewCellWithImage(s: story));
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: GoogleFonts.aBeeZee(fontSize: 20),
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: _buildPreviews(widget.previews),
                ))));
  }
}
