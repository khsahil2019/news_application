import 'package:flutter/material.dart';
import '../models/news_article.dart';

class NewsDetailPage extends StatefulWidget {
  final NewsArticle newsArticle;

  const NewsDetailPage({Key? key, required this.newsArticle}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newsArticle.newsTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.newsArticle.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.newsArticle.newsTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    isExpanded
                        ? widget.newsArticle.newsDescription
                        : widget.newsArticle.newsDescription.length > 100
                            ? widget.newsArticle.newsDescription
                                    .substring(0, 100) +
                                '...'
                            : widget.newsArticle.newsDescription,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  if (widget.newsArticle.newsDescription.length > 100)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded ? 'See Less' : 'See More',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
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
