import 'package:blog_application/app.dart';
import 'package:blog_application/post/data/model/blog_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Register Adapters for each class
  Hive.registerAdapter(BlogPostAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(AuthorAdapter());
  Hive.registerAdapter(CommentAdapter());

  if (!Hive.isBoxOpen('blogs')) {
    await Hive.openBox<BlogPost>('blogs');
  }
  runApp(const BlogApp());
}

