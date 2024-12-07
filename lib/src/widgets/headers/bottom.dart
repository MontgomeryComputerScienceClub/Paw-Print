import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/story.dart';
import 'package:share_plus/share_plus.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({
    super.key,
    required this.linkedStory,
  });

  final Story linkedStory;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Constants.bottomAppBarColor,
      child: Row(
        children: <Widget>[
          IconButton(
            tooltip: 'Go back',
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const Spacer(),
          IconButton(
            tooltip: 'Share',
            icon: const Icon(Icons.ios_share),
            onPressed: () {
              //TODO: implement share url has to link to website url somehow? so modify model later
              Share.share('https://example.com', subject: 'Share article');
            },
          ),
          IconButton(
              tooltip: 'Save',
              icon: const Icon(Icons.save_alt),
              onPressed: widget.linkedStory.titleImageAndID.saved
                  ? null
                  : () async {
                      await widget.linkedStory.titleImageAndID.toDisk();
                      setState(() {});
                      // ignore: use_build_context_synchronously
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text("Story saved"),
                            );
                          });
                    }),
        ],
      ),
    );
  }
}
