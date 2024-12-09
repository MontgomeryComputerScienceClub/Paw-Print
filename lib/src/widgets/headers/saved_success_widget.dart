import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';

class SavedSuccessfully extends StatelessWidget {
  const SavedSuccessfully({super.key, required this.story});

  final Story story;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Saved Successfully"),
      content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(child: story.titleImageAndID.getImageWidget()),
            Text(
              story.titleImageAndID.title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            )
          ]),
    );
  }
}
