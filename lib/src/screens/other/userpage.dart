import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/utils/stories.dart';
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

  Widget _genSavedStoryWidget(StoryPreview preview, int index, BuildContext context) {
    return InkWell(
      onLongPress: () {
        showModalBottomSheet(
            backgroundColor: Constants.savedStoriesBottomModalBGColor,
            useSafeArea: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), //for the round edges
            builder: (context) {
              return Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: Text(
                    "Delete article?",
                    style: GoogleFonts.aBeeZee(),
                  ),
                  onTap: () {
                    var previewToUndo = preview;
                    setState(() {
                      widget.previews.removeAt(index);
                      StoryPreview.removeIndexFromDisk(index);
                    });
                    Navigator.of(context).pop();

                    SnackBar snackbar = SnackBar(
                      backgroundColor: Colors.black54,
                      content: const Text("Successfully deleted saved article"),
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
                ),
                ListTile(
                  title: Text(
                    "Share article?",
                    style: GoogleFonts.aBeeZee(),
                  ),
                  leading: const Icon(Icons.share),
                  onTap: () {
                    shareStory(widget.previews[index]);
                  },
                ),
                const SizedBox(height: 20),
              ]);
            },
            context: context,
            isDismissible: true);
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10), child: PreviewCellWithImage(s: widget.previews[index])),
    );
  }

  List<Widget> _genSavedStories(BuildContext context) {
    List<Widget> ret = [];
    for (int i = 0; i < widget.previews.length; i++) {
      ret.add(_genSavedStoryWidget(widget.previews[i], i, context));
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
