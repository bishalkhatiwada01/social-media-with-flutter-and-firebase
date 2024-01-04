// lib/news/service/news_service.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:socialmediaapp/features/news/models/news_model.dart';

class NewsService {
  Future<List<NewsModel>> getNews() async {
    try {
      print('Converting');
      // Load data from the JSON file
      String jsonData = await rootBundle.loadString('assets/news_data.json');

      Map<String, dynamic> jsonMap = json.decode(jsonData);
      List<dynamic> data = jsonMap["news"];

      // Convert data to a list of NewsModel
      List<NewsModel> newsList =
          data.map((json) => NewsModel.fromJson(json)).toList();
      return newsList;
    } catch (error) {
      throw Exception("Failed to load news: $error");
    }
  }
}
