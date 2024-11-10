import 'package:flutter/material.dart';
import 'package:myapp/src/constants.dart';
import 'package:myapp/src/screens/home/thisissue.dart';
import 'package:myapp/src/widgets/headers/header.dart';
import 'package:myapp/src/widgets/navbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        //TODO: for later
        length: Constants.columns.length,
        child: const Scaffold(
          appBar: Header(
            implyleading: false,
            includeSearch: true,
          ),
          bottomNavigationBar: Navbar(
            selectedIndex: 0,
          ),
          body: TabBarView(
            children: [
              ThisIssue(),
              ThisIssue(),
              ThisIssue(),
              ThisIssue(),
              ThisIssue(),
              ThisIssue(),
              ThisIssue(),
            ],
          ),
        ));
  }
}
