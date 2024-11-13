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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: Constants.columns.length,
      initialIndex: Constants.columnsThisIssueIndex,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        tabController: _tabController,
        implyleading: false,
        includeSearch: true,
      ),
      bottomNavigationBar: const Navbar(
        selectedIndex: 0,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ThisIssue(),
          ThisIssue(),
          ThisIssue(),
          ThisIssue(),
          ThisIssue(),
          ThisIssue(),
          ThisIssue(),
        ],
      ),
    );
  }
}
