import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/news_respons/NewsResponse.dart';
import 'package:news/source_respons/SourcesResponse.dart';

class ApiManager {
  static const baseUrl = 'newsapi.org';
  static const apiKey = '5c12e477898941c590efd00ca550d027';

  static Future<SourcesResponse> getSources(String categoryId) async {
    //apiKey=API_KEY
    var uri = Uri.https(baseUrl, 'v2/top-headlines/sources',
        {
          "apiKey": apiKey,
          "category": categoryId,
        });
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;

    //response.body;
  }

  static Future<NewsResponse> getNews(String? sourcesId)async {
    var url = Uri.https(baseUrl, "v2/everything",
        {
          "apiKey": apiKey,
          "sources": sourcesId,
        });
    var response =await http.get(url);
    var json =jsonDecode(response.body);
    var newsResponse =NewsResponse.fromJson(json);
    return newsResponse;
  }
}