import 'package:flutter/material.dart';
import 'package:myapp/src/app.dart';
import 'package:myapp/src/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<ThemeData> themelist = await giveMeLightAndDark();
  ThemeData lightTheme = themelist[0];
  ThemeData darkTheme = themelist[1];

  runApp(Pawprint(
    lightTheme: lightTheme,
    darkTheme: darkTheme,
  ));
}
