import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String content;
  final String category;
  final int views;
  final String thumbnail;
  final bool isFeatured;

  const NewsCard({
    super.key,
    required this.title,
    required this.content,
    required this.category,
    required this.views,
    required this.thumbnail,
    required this.isFeatured,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('Category: $category'),
                const SizedBox(width: 16),
                Text('Views: $views'),
              ],
            ),
            if (isFeatured) const Text('Featured', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}