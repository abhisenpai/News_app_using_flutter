import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_app/models/newsinfo.dart';
class API_Manager{
  Future<NewsModel> getNews() async{
    var client = http.Client();
    var response =await client.get('http://newsapi.org/v2/everything?domains=wsj.com&apiKey=3e99d5cb2ad34a4596a99700a9550091');
    var newsModel;
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    }
    catch(Exception){
      return newsModel;
    }
    return newsModel;
  }
}