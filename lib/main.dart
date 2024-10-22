import 'package:flutter/material.dart';
import 'package:myapp/src/app.dart';
import 'package:myapp/src/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeData theme = await giveMeTheme();
  runApp(Pawprint(theme: theme));
}
