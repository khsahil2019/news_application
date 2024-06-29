import 'package:cloud_firestore/cloud_firestore.dart';

class NewsArticle {
  final String imageUrl;
  final String newsTitle;
  final String newsDescription;
  final DateTime timestamp;

  NewsArticle({
    required this.imageUrl,
    required this.newsTitle,
    required this.newsDescription,
    required this.timestamp,
  });

  factory NewsArticle.fromFirestore(Map<String, dynamic> data) {
    return NewsArticle(
      imageUrl: data['imageUrl'],
      newsTitle: data['newsTitle'],
      newsDescription: data['newsDescription'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }
}
