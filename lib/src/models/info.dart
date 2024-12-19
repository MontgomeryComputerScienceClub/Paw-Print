import 'dart:convert';
import 'package:numerus/numerus.dart';
import 'package:myapp/src/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Info {
  final int issue;

  Info({required this.issue});

  factory Info.fromJson(json) {
    return Info(issue: json[Constants.infoIssueKey]);
  }

  Map<String, dynamic> toJson() {
    return {Constants.infoIssueKey: issue};
  }

  String issueToNumeral() {
    return issue.toRomanNumeralString() ?? "";
  }

  Future<void> toDisk() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.diskInfoKey, jsonEncode(toJson()));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Info && runtimeType == other.runtimeType && issue == other.issue;

  @override
  int get hashCode => issue.hashCode;
}
