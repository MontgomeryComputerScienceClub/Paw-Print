import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/utils/stories.dart';

import 'saved_success_widget.dart';

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
    Future<bool> isSaved = widget.linkedStory.titleImageAndID.isSaved();
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
              shareStory(widget.linkedStory.titleImageAndID);
            },
          ),
          FutureBuilder<bool>(
              future: isSaved,
              builder: ((context, snapshot) {
                return IconButton(
                    tooltip: snapshot.hasData
                        ? snapshot.data ?? false
                            ? 'Article already saved'
                            : 'Save'
                        : 'Error',
                    icon: const Icon(Icons.save_alt),
                    onPressed: snapshot.hasData
                        ? snapshot.data ?? false
                            ? null
                            : () async {
                                await widget.linkedStory.titleImageAndID.addToDisk();
                                setState(() {
                                  isSaved = widget.linkedStory.titleImageAndID.isSaved();
                                });

                                if (!mounted) return;
                                showDialog(
                                    // ignore: use_build_context_synchronously
                                    context: context,
                                    builder: (context) {
                                      return SavedSuccessfully(story: widget.linkedStory);
                                    });
                              }
                        : null);
              })),
        ],
      ),
    );
  }
}
