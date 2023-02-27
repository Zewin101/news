import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_z/models/NewsDataModel.dart';

import 'package:news_z/models/Sources_Response.dart';
import 'package:news_z/shared/constants/constants.dart';

class ApiManager {
  static Future<SourcesResponse> getSources(
      {String? category}) async {
    var url = Uri.https(baseUrl, endPointSources,
        {ApiKey: Api_Key, "category": category});
    Response? response;
    try {
      response = await http.get(url);
      var json = jsonDecode(response.body);
      print(json);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw (e);
    }
  }

  static Future<NewsDataModel> getNewsData(String source_Id) async {
    Uri url = Uri.https(
        baseUrl, endPointEverything, {ApiKey: Api_Key, sourceId: source_Id});
    Response response = await http.get(url);
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }

  static Future<SourcesResponse> getSearch(String search) async {
    var url =
        Uri.https(baseUrl, endPointSources, {ApiKey: Api_Key, "q": search});
    Response? response;
    try {
      response = await http.get(url);
      var json = jsonDecode(response.body);
      print(json);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      throw (e);
    }
  }
}
