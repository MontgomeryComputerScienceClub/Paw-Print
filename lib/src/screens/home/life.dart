import 'package:flutter/material.dart';

class Life extends StatelessWidget {
  const Life({super.key});

  _generateChildren() {}

  @override
  Widget build(BuildContext context) {
    var e = _generateChildren();
    return SafeArea(
        //TODO: implement scroll down update logic -> should query first 10 and then append children
        child: ListView.builder(
      itemBuilder: (context, index) {
        return e[index];
      },
      itemCount: e.length,
    ));
  }
}
