import 'package:flutter/material.dart';
import '../models/news_article.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class NewsCard extends StatelessWidget {
  final NewsArticle newsArticle;
  final Function onTap;

  const NewsCard({Key? key, required this.newsArticle, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat.yMMMd().add_jm().format(newsArticle.timestamp);

    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.network(
                newsArticle.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsArticle.newsTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
