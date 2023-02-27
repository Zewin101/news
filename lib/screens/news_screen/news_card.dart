
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_z/models/NewsDataModel.dart';

import '../details_screen/details_screen.dart';

class newsItem extends StatelessWidget {

Articles articles;

newsItem(this.articles);

@override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Details_Screen.routeName,arguments: articles);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15)
        ),

        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.32,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )
              ),
              child:
              CachedNetworkImage(
                imageUrl: articles.urlToImage??"",
                  height: MediaQuery.of(context).size.height*.32,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress,
                    color: Colors.green,
                    )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Text(articles.author??'',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
            ),
            ),
            Text(articles.title??'',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(articles.publishedAt?.substring(0,10)??'',
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
