import 'package:flutter/material.dart';
import 'package:news_z/models/NewsDataModel.dart';
import 'package:news_z/screens/news_screen/tabItem.dart';


import 'package:news_z/shared/network/remote/api_manager.dart';

import '../../models/Sources_Response.dart';
import 'news_card.dart';

class TapController extends StatefulWidget {
  List<Sources> sources;

  TapController(this.sources);

  @override
  State<TapController> createState() => _TapControllerState();
}

class _TapControllerState extends State<TapController> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              indicatorColor: Colors.transparent,
              isScrollable: true,
              onTap: (index) {
                selectedIndex = index;
                print(selectedIndex);
                setState(() {});
              },
              labelColor: Colors.green,
              tabs: widget.sources
                  .map((e) => Tab(
                      child: TabItem(
                          e,
                          widget.sources.indexOf(e) == selectedIndex
                              ? true
                              : false)))
                  .toList(),
            )),
        Expanded(
          child: FutureBuilder<NewsDataModel>(
            future:
                ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("error"),
                );
              }
              var newsData = snapshot.data?.articles ?? [];
              return ListView.builder(
                itemCount: newsData.length,
                itemBuilder: (context, index) {
                  return newsItem(newsData[index]);
                },
              );
            },
          ),
        )
      ],
    );
  }
}
