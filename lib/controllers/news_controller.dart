import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/news_article.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var newsArticles = <NewsArticle>[].obs;

  @override
  void onInit() {
    fetchNewsArticles();
    super.onInit();
  }

  void fetchNewsArticles() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('news').get();
      newsArticles.value = querySnapshot.docs
          .map((doc) =>
              NewsArticle.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching news: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
