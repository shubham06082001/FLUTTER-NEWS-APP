import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:i_news/models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=95c8a72cc99149318f8bab6e82c7c3c5");

    // var response = await http.get(Uri.https("https://newsapi.org",
    //     "v2/top-headlines?country=us&category=business&apiKey=95c8a72cc99149318f8bab6e82c7c3c5"));

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            // publishedAt: element["publishedAt"],
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getCategoryNews(String category) async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=95c8a72cc99149318f8bab6e82c7c3c5");

    // var response = await http.get(Uri.https("https://newsapi.org",
    //     "v2/top-headlines?country=us&category=business&apiKey=95c8a72cc99149318f8bab6e82c7c3c5"));

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            // publishedAt: element["publishedAt"],
          );

          news.add(articleModel);
        }
      });
    }
  }
}
