import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/assets.dart';
import '../../models/NewsDataModel.dart';

class Details_Screen extends StatelessWidget {
   Details_Screen({Key? key}) : super(key: key);

  static const String routeName = "details";

  @override
  Widget build(BuildContext context) {
    
    var news = ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(Assets.imagesPattern),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.green,
          shape: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          title: Text(news.author ?? ""),
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .32,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? "",
                  height: MediaQuery.of(context).size.height * .32,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: Colors.green,
                  )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Text(
                news.title ?? '',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                news.description ?? '',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                   TextButton.icon(
                       onPressed: ()async{
                        await  openUrl(news.url);

                       },
                       icon:const Text(
                         'View Full Articie',
                         textAlign: TextAlign.right,
                         style: TextStyle(
                           fontSize: 15,
                         ),
                       ),
                       label:  Icon(Icons.arrow_right_outlined))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   openUrl(String? url) async{
    if(url==null){
      return;
    }
    var uri =Uri.parse(url);
    if(await canLaunchUrl(uri)){
     await launchUrl(uri);
    }

  }
}
