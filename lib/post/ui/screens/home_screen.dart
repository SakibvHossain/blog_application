import 'package:blog_application/post/data/controller/post_controller.dart';
import 'package:blog_application/post/data/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Posts'),
        centerTitle: true,
      ),
      body: Obx((){
        return RefreshIndicator(
          onRefresh: () async {
            controller.fetchProductsFromApi();
          },
          child: ListView.builder(
            itemCount: controller.posts.length, // Example: Assuming 5 posts
            itemBuilder: (context, index) {
              BlogPost post = controller.posts[index];
              return BlogPostCard(
                title: post.title,
                content: post.content,
                category: post.category.categoryTitle,
                author: post.author.name,
                date: post.addedDate,
                imageUrl: post.image,
                // Placeholder image
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 600),
                      pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: BlogDetailPage(
                            title: post.title,
                            content: post.content,
                            category: post.category.categoryTitle,
                            author: post.author.name,
                            date: post.addedDate,
                            imageUrl: post.image,
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        );
      })
    );
  }
}

class BlogPostCard extends StatelessWidget {
  final String title;
  final String content;
  final String category;
  final String author;
  final String date;
  final String imageUrl;
  final VoidCallback onTap;

  const BlogPostCard({
    super.key,
    required this.title,
    required this.content,
    required this.category,
    required this.author,
    required this.date,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category: $category',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    'By: $author',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Published on: $date',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogDetailPage extends StatelessWidget {
  final String title;
  final String content;
  final String category;
  final String author;
  final String date;
  final String imageUrl;

  BlogDetailPage({
    required this.title,
    required this.content,
    required this.category,
    required this.author,
    required this.date,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                content,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Category: $category',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'By: $author',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Published on: $date',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
