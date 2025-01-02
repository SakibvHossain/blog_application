import 'package:blog_application/post/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      home: HomeScreen(),
    );
  }
}
