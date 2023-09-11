

import 'package:flutter_application_1/api/article_api.dart';
import 'package:flutter_application_1/models/article.dart';

class ArticleRepo {
  final api = ArticleAPI();

  Future<List<Article>> getArticles() => api.fetchArticles();
  
}