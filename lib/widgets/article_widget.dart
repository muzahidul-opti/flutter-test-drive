import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          CardBanner(imageUrl: article.urlToImage),
          CardDetail(article: article)
        ],
      ),

    );
  }
}


class CardBanner extends StatelessWidget {
  final String? imageUrl;

  const CardBanner({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(2), 
            topRight: Radius.circular(2)
            ),
          child: SizedBox(
            height: 200.0,
            width: double.infinity,
            child: Image.network(
              imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            icon: const Icon(Icons.bookmark, size: 32),
            onPressed: () {

            },
            ) ,
        )
      ],
    );
  }
}


class CardDetail extends StatelessWidget {
  final Article? article;
   CardDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        Text(
          article?.title ?? "", 
          style: const TextStyle(fontSize: 20), maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8),

        Row(
          children: [
            Text(article?.source ?? "", style: const TextStyle(fontSize: 16)),
            const Spacer(),
            const Text("45 commnets")
          ],
        ),
        
      ]),
    );
  }
}

