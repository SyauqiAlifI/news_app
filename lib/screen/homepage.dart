import 'package:flutter/material.dart';
import 'package:news_app/model/model.dart';
import 'package:news_app/screen/newspage.dart';
import 'package:news_app/service/service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var news = News();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset('images/myMuka.jpg'),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'Good Morning',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark,
                color: Colors.blue,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshot) => snapshot.data != null
            ? NewsPage(article: snapshot.data as List<Article>)
            : const Center(
                child: const CircularProgressIndicator(),
              ),
      ),
    );
  }
}
