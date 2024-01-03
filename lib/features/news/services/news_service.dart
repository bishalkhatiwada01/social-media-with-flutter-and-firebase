// lib/news/service/news_service.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:socialmediaapp/features/news/models/news_model.dart';

class NewsService {
  Future<List<NewsModel>> getNews() async {
    try {
      // Load data from the JSON file
      String jsonData = await rootBundle.loadString('lib/news/news_data.json');
      List<dynamic> data = json.decode(jsonData);

      // Convert data to a list of NewsModel
      List<NewsModel> newsList =
          data.map((json) => NewsModel.fromJson(json)).toList();
      return newsList;
    } catch (error) {
      throw Exception("Failed to load news: $error");
    }
  }
}
