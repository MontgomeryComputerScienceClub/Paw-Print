import 'package:flutter/material.dart';
import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/widgets/header.dart';

class EntireArticlePage extends StatefulWidget {
  const EntireArticlePage(
      {super.key, required this.main, required this.relatedStories});

  final Story main;
  //use backend to generate related stories??
  //TODO: I would recommend us to just use a future builder for the related stories and then pass the content as an argument?
  // or we future build the content and pass the the related storeies as before
  final List<Story> relatedStories;

  @override
  State<EntireArticlePage> createState() => _EntireArticlePageState();
}

class _EntireArticlePageState extends State<EntireArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Header(
          implyleading: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: []))));
  }
}
