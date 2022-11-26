import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;

import '../models/article.dart';
import '../models/news.dart';

final Uri _url = Uri.parse(
    'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0e26e464830941f7b9c7f82f37151c2e');

class NewsService {
  static NewsService _singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService() {
    return _singleton;
  }

  static Future<List<Articles>?> getNews() async {
    final response = await http.get(_url);

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }
}
