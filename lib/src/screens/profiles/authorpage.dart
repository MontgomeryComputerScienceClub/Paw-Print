import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/models/author.dart';
import 'package:myapp/src/models/storypreview.dart';
import 'package:myapp/src/routes/noanimation.dart';
import 'package:myapp/src/screens/article/entirearticle.dart';

class AuthorDisplayScreen extends StatefulWidget {
  const AuthorDisplayScreen({super.key, required this.author});

  final Author author;

  @override
  State<AuthorDisplayScreen> createState() => _AuthorDisplayScreenState();
}

class _AuthorDisplayScreenState extends State<AuthorDisplayScreen> {
  List<Widget> _buildPreviews(List<StoryPreview> stories) {
    List<Widget> ret = [];
    for (StoryPreview story in stories) {
      ret.add(
        ListTile(
          contentPadding: EdgeInsets.zero,
          trailing: SizedBox(
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: story.getImageWidget(),
            ),
          ),
          title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                story.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          subtitle: Text(
            story.blurb ?? "",
            style: TextStyle(fontSize: 15, color: Constants.listArticleBlurbColor, height: 1.4),
          ),
          onTap: () async {
            //TODO: modify this and the one in preview cell to actually get the story
            var entireStory = await story.getStoryFromPreview();

            Navigator.of(context).push(NoAnimationRoute(
                child: EntireArticlePage(
              main: entireStory,
              relatedStories: [],
            )));
          },
        ),
      );
    }

    return ret;
  }

  List<Widget> _buildBody() {
    List<Widget> ret = [];
    ret.addAll(
      [
        Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Constants.authorProfilePicBGColor,
              radius: 60,
              child: ClipOval(child: widget.author.getProfileImageWidget()),
            )),
        const SizedBox(height: 30),
        Text(
          widget.author.name,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 25),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.author.bio,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(height: 1.5),
          ),
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
      ],
    );
    ret.addAll(_buildPreviews(widget.author.getStories()));
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _buildBody())))));
  }
}
