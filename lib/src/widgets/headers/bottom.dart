import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/story.dart';
import 'package:share_plus/share_plus.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
    required this.linkedStory,
  });

  final Story linkedStory;

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
              //TODO: implement share url
              // has to link to website url somehow?
              // so modify model later
              Share.share('check out my website https://example.com', subject: 'Look what I made!');
            },
          ),
          IconButton(
            tooltip: 'Save',
            icon: const Icon(Icons.save_alt),
            onPressed: () {
              //TODO: implement saving article
            },
          ),
        ],
      ),
    );
  }
}
