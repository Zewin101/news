import 'package:flutter/material.dart';
import 'package:news_z/models/categoryData.dart';
import 'package:news_z/screens/news_screen/tapController.dart';

import '../models/Sources_Response.dart';
import '../shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {
  CategoryData? categoryData;

  String? searchWord;

  HomeScreen(
      {required this.categoryData,required this.searchWord});
  bool shouldPop = true;
  @override
  Widget build(BuildContext context) {

    return  FutureBuilder<SourcesResponse>(
            future: ApiManager.getSources(category: categoryData!.id),
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

  }
}
