
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/article.dart';
import 'package:flutter_application_1/widgets/article_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
            width: 200,
          ),
      ),
     body: ListView.builder(
      itemCount: articles.length,
      itemBuilder: (item, index) {
        return ArtcileCard(article: articles[index]);
      }
     ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("clicked");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}