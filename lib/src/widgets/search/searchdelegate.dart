import 'package:flutter/material.dart';

class PaperSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = "";
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(query, style: Theme.of(context).textTheme.bodyLarge));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> possibleResults = [
      "hello",
      "asfds",
    ];

    return ListView.builder(
        itemCount: possibleResults.length,
        itemBuilder: (context, index) {
          final suggestion = possibleResults[index];
          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
            },
          );
        });
  }
}
//TODO: Link to follow along: https://www.youtube.com/watch?v=TlbbIQykHK0