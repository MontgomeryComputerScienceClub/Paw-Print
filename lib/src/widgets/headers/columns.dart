import 'package:flutter/material.dart';

class Columns extends StatelessWidget {
  const Columns({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        //TODO: Remove the height and put it in constants
        height: 20,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [ElevatedButton(onPressed: () {}, child: Text("hello"))],
        ));
  }
}
