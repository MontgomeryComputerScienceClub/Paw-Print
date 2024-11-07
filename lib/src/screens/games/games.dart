import 'package:flutter/material.dart';
import 'package:myapp/src/widgets/header.dart';
import 'package:myapp/src/widgets/navbar.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: Header(
          implyleading: false,
        ),
        bottomNavigationBar: Navbar(
          selectedIndex: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: []),
        )));
  }
}
