import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/constants.dart';

class Columns extends StatefulWidget {
  const Columns({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  State<Columns> createState() => _ColumnsState();
}

class _ColumnsState extends State<Columns> {
  final ScrollController _scrollController = ScrollController();

  // void _scrollToIndex() {
  //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  //   _scrollController.
  // }
  void jumpToItem(int index) {
    _scrollController.animateTo(
      index * 55,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  List<Widget> _generateColumns() {
    List<Widget> ret = [];

    for (int i = 0; i < Constants.columns.length; i++) {
      String col = Constants.columns[i];

      if (i != widget.selectedIndex) {
        ret.add(TextButton(
            onPressed: () {}, child: Text(col, style: GoogleFonts.aBeeZee())));
      } else {
        //do some special processing here
        ret.add(TextButton(
            onPressed: () {},
            child: Text(
              col,
              style: TextStyle(decoration: TextDecoration.underline),
            )));
      }
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => jumpToItem(widget.selectedIndex));
    return SizedBox(
        //TODO: Remove the height and put it in constants
        height: 20,
        child: ListView(
            shrinkWrap: true,
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: _generateColumns()));
  }
}
