import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/views/profile_screen.dart';
import '../controllers/news_controller.dart';
import 'news_card.dart';
import 'news_detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsController newsController = Get.put(NewsController());
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CategoriesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (newsController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (newsController.newsArticles.isEmpty) {
        return Center(child: Text('No articles found.'));
      }

      return ListView.builder(
        itemCount: newsController.newsArticles.length,
        itemBuilder: (context, index) {
          return NewsCard(
            newsArticle: newsController.newsArticles[index],
            onTap: () {
              Get.to(() => NewsDetailPage(
                  newsArticle: newsController.newsArticles[index]));
            },
          );
        },
      );
    });
  }
}

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Categories Screen'));
  }
}
