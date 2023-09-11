
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repos/article_repo.dart';
import '../models/article.dart';
import '../widgets/article_widget.dart';
import 'article_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Article>>? _futureArticles;

  
  @override
  void initState() {
    super.initState();
    _futureArticles = ArticleRepo().getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: _futureArticles ,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (item, index) {
              final article = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => ArticlePage(article: article),
                    )
                  );
                },
                child: ArticleCard(article: article),
              );
              
            },
          );
        } 
        if (snapshot.hasError) {
          return Center(
            child: Text(
              '${snapshot.error}',
              style: const TextStyle(fontSize: 24),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}