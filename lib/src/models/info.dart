import 'dart:convert';
import 'package:myapp/src/models/test.dart';
import 'package:numerus/numerus.dart';
import 'package:myapp/src/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Info {
  final int issue;

  Info({required this.issue});

  factory Info.fromJson(json) {
    return Info(issue: json[Constants.infoIssueKey]);
  }

  Map<String, dynamic> toMap() {
    return {Constants.infoIssueKey: issue};
  }

  String toJsonString() {
    return jsonEncode(toMap());
  }

  String issueToNumeral() {
    return issue.toRomanNumeralString() ?? "XX";
  }

  Future<void> toDisk() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.diskInfoKey, toJsonString());
  }

  Future<Info?> fromDisk() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonString = prefs.getString(Constants.diskInfoKey);
    if (jsonString == null) {
      return null;
    }
    Info info = Info.fromJson(null);
    return info;
  }

  Future<Info?> fetchCurrentInfo() async {
    //TODO: api get request or database read?
    return currentPaper;
  }

  static Future<Info> syncInfo() async {
    Info info;
    Info? serverNews = await Info(issue: 0).fetchCurrentInfo();
    Info? localNews = await Info(issue: 0).fromDisk();
    if (serverNews != null) {
      if (localNews != null) {
        if (serverNews != localNews) {
          //this is fine -- this means that the local copy is not the same as server
          serverNews.toDisk();
          info = serverNews;
        } else {
          //this is fine -- this means that the local copy and server one is equal yipee!
          info = serverNews;
        }
      } else {
        //this is fine -- it just means that there is no local copy
        serverNews.toDisk();
        info = serverNews;
      }
    } else {
      //this means that maybe the server is not responding??
      if (localNews != null) {
        //use the local copy's info ig
        info = localNews;
      } else {
        //GG"S YOU are COOOOOOKED
        info =
            currentPaper; //rn lets just leave it like this for now but we pray that this is NEVER triggerd
      }
    }
    return info;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Info && runtimeType == other.runtimeType && issue == other.issue;

  @override
  int get hashCode => issue.hashCode;
}
