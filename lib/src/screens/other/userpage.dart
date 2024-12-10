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
    for (int i = 0; i < widget.previews.length; i++) {
      ret.add(InkWell(
        onLongPress: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), //for the round edges
              builder: (context) {
                return Container(
                    height: 200,
                    child: const Column(children: [
                      Row(children: [Text("Actions")])
                    ]) //what you want to have inside, I suggest using a column
                    );
              },
              context: context,
              isDismissible: true);
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10), child: ImagedPreviewCell(s: widget.previews[i])),
      ));
      //TODO: adsfaklsf
      ret.add(Dismissible(
        background: Container(decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(25))),
        key: ValueKey(i),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10), child: ImagedPreviewCell(s: widget.previews[i])),
        onDismissed: (DismissDirection direction) async {
          var previewToUndo = widget.previews[i];
          setState(() {
            widget.previews.removeAt(i);
            StoryPreview.removeIndexFromDisk(i);
          });

          SnackBar snackbar = SnackBar(
            content: const Text("Successfully Deleted Saved Article"),
            action: SnackBarAction(
              label: "Undo?",
              onPressed: () async {
                setState(() {
                  widget.previews.add(previewToUndo);
                  previewToUndo.addToDisk();
                });
              },
            ),
          );
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
      ));
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
              setState(() {
                StoryPreview.clearDisk();
                widget.previews = [];
              });
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
