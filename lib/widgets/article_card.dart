import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  // @override
  // Widget build(BuildContext context) {
  //   final isPortraite = MediaQuery.of(context).orientation == Orientation.portrait;
  //   return Card(
  //     margin: const EdgeInsets.all(16),
  //     elevation: 4.0,
  //     child: isPortraite ? TallCard(article: article) : WideCard(article: article)
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:  const EdgeInsets.all(16),
      elevation: 4,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return TallCard(article: article);
          } else {
            return WideCard(article: article);
          }
        },
      ),
    );
  }

}


class TallCard extends StatelessWidget {
  final Article article;

  const TallCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardBanner(imageUrl: article.urlToImage, wideCard: false,),
        CardDetail(article: article)
      ]
    );
  }
}

class WideCard extends StatelessWidget {
  final Article article;

  const WideCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CardBanner(
          imageUrl: article.urlToImage,
          wideCard: true,
        ),
        Expanded(
          child: CardDetail(article: article),
        )
      ]
    );
  }
}

class CardBanner extends StatelessWidget {
  final String? imageUrl;
  final bool wideCard;
  const CardBanner({super.key, required this.imageUrl, required this.wideCard});

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
            height: wideCard ? 150 : 200.0,
            width: wideCard ? 150 : double.infinity,
            child: Image.network(
              imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: wideCard ? 2 : 10,
          right: wideCard ? 2 : 10,
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
  const CardDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final isPortraite = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      padding: const EdgeInsets.all(16),
      height: isPortraite ? 130 : 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(
          article?.title ?? "", 
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 20), maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

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

