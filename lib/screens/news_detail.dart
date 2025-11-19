import 'package:flutter/material.dart';
import 'package:football_shop/models/news_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsEntry news;

  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Category: ${news.category}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8),
            Text(
              'Views: ${news.newsViews}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8),
            if (news.isFeatured)
              const Text(
                'Featured',
                style: TextStyle(fontSize: 16.0, color: Colors.red),
              ),
            const SizedBox(height: 16),
            Text(
              news.content,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}