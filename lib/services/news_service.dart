import 'package:flutter/material.dart';
import 'package:news_world_app/config/environment/environment.dart';
import 'package:news_world_app/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsService extends ChangeNotifier {
  final _NEWS_API = "https://newsapi.org/v2/";
  final _API_KEY = Environment.newsAPIkey;
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url =
        Uri.parse("$_NEWS_API/top-headlines?country=us&apiKey=$_API_KEY");

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
