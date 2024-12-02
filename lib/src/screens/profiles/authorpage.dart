import 'package:flutter/material.dart';
import 'package:myapp/src/models/author.dart';

class AuthorDisplayScreen extends StatefulWidget {
  const AuthorDisplayScreen({super.key, required this.author});

  final Author author;

  @override
  State<AuthorDisplayScreen> createState() => _AuthorDisplayScreenState();
}

class _AuthorDisplayScreenState extends State<AuthorDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    //TODO: implement this later -> take inspiration from NYT's app for author display
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  //TODO change color
                  radius: 50,
                  child: widget.author.getProfileImageWidget(),
                )),
          ],
        ))));
  }
}
