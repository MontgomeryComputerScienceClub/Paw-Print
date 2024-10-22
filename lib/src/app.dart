import 'package:flutter/material.dart';
import 'package:myapp/src/screens/home.dart';

class Pawprint extends StatefulWidget {
  const Pawprint({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<Pawprint> createState() => _Pawprint();
}

class _Pawprint extends State<Pawprint> {
  bool? tokenExists = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Pawprint.navigatorKey,
        title: "Supplyit!",
        theme: widget.theme,
        home: const Home());
  }
}
