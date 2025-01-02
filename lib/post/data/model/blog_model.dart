import 'package:hive/hive.dart';

part 'blog_model.g.dart'; // Run the build_runner command to generate this file

@HiveType(typeId: 0) // Type ID to identify this class in Hive
class BlogModel {
  @HiveField(0)
  String status;

  @HiveField(1)
  String message;

  @HiveField(2)
  BlogData data;

  BlogModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      status: json['status'],
      message: json['message'],
      data: BlogData.fromJson(json['data']),
    );
  }
}

@HiveType(typeId: 1)
class BlogData {
  @HiveField(0)
  List<BlogPost> content;

  @HiveField(1)
  int pageNumber;

  @HiveField(2)
  int pageSize;

  @HiveField(3)
  int totalPages;

  @HiveField(4)
  int totalElements;

  @HiveField(5)
  bool lastPage;

  BlogData({
    required this.content,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.totalElements,
    required this.lastPage,
  });

  factory BlogData.fromJson(Map<String, dynamic> json) {
    return BlogData(
      content: (json['content'] as List)
          .map((e) => BlogPost.fromJson(e))
          .toList(),
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      totalPages: json['totalPages'],
      totalElements: json['totalElements'],
      lastPage: json['lastPage'],
    );
  }
}

@HiveType(typeId: 2) // Unique ID for each class
class BlogPost {
  @HiveField(0)
  int postId;

  @HiveField(1)
  String title;

  @HiveField(2)
  String image;

  @HiveField(3)
  String content;

  @HiveField(4)
  String addedDate;

  @HiveField(5)
  Category category;

  @HiveField(6)
  Author author;

  @HiveField(7)
  List<Comment> comments;

  BlogPost({
    required this.postId,
    required this.title,
    required this.image,
    required this.content,
    required this.addedDate,
    required this.category,
    required this.author,
    required this.comments,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      postId: json['postId'],
      title: json['title'],
      image: json['image'],
      content: json['content'],
      addedDate: json['addedDate'],
      category: Category.fromJson(json['category']),
      author: Author.fromJson(json['author']),
      comments: (json['comments'] as List)
          .map((item) => Comment.fromJson(item))
          .toList(),
    );
  }
}


@HiveType(typeId: 3)
class Category {
  @HiveField(0)
  int categoryId;

  @HiveField(1)
  String categoryTitle;

  @HiveField(2)
  String categoryDescription;

  Category({
    required this.categoryId,
    required this.categoryTitle,
    required this.categoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      categoryTitle: json['category_title'],
      categoryDescription: json['category_description'],
    );
  }
}

@HiveType(typeId: 4)
class Author {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String about;

  Author({
    required this.id,
    required this.name,
    required this.email,
    required this.about,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      about: json['about'],
    );
  }
}

@HiveType(typeId: 5)
class Comment {
  @HiveField(0)
  int commentId;

  @HiveField(1)
  String commentText;

  @HiveField(2)
  String commentDate;

  Comment({
    required this.commentId,
    required this.commentText,
    required this.commentDate,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentId: json['commentId'],
      commentText: json['commentText'],
      commentDate: json['commentDate'],
    );
  }
}
