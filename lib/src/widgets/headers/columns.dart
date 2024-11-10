import 'package:flutter/material.dart';

class Columns extends StatefulWidget {
  const Columns(
      {super.key, required this.columns, required this.selectedIndex});

  final List<String> columns;
  final int selectedIndex;

  @override
  State<Columns> createState() => _ColumnsState();
}

class _ColumnsState extends State<Columns> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        //TODO: Remove the height and put it in constants
        height: 20,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  TextButton(onPressed: () {}, child: Text("hello")),
                  TextButton(onPressed: () {}, child: Text("hello")),
                  TextButton(onPressed: () {}, child: Text("This Issue")),
                  TextButton(onPressed: () {}, child: Text("hello")),
                  TextButton(onPressed: () {}, child: Text("hello")),
                ],
              )
            ]));
  }
}
