import 'package:flutter/material.dart';

import '../../models/Sources_Response.dart';
import '../../screens/news_screen/tapController.dart';
import '../../shared/network/remote/api_manager.dart';

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {
      showResults(context);
    }, icon: Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.clear));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSearch(searchFieldLabel! ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.data?.message}"));
        }
        if (snapshot.data?.status != "ok") {
          return Center(child: Text("${snapshot.data?.message}"));
        }
        var sources = snapshot.data?.sources ?? [];
        return TapController(sources);
      },
    );
    ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("Suggestions"));
  }
}
