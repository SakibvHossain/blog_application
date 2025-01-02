// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogModelAdapter extends TypeAdapter<BlogModel> {
  @override
  final int typeId = 0;

  @override
  BlogModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogModel(
      status: fields[0] as String,
      message: fields[1] as String,
      data: fields[2] as BlogData,
    );
  }

  @override
  void write(BinaryWriter writer, BlogModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BlogDataAdapter extends TypeAdapter<BlogData> {
  @override
  final int typeId = 1;

  @override
  BlogData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogData(
      content: (fields[0] as List).cast<BlogPost>(),
      pageNumber: fields[1] as int,
      pageSize: fields[2] as int,
      totalPages: fields[3] as int,
      totalElements: fields[4] as int,
      lastPage: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BlogData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.pageNumber)
      ..writeByte(2)
      ..write(obj.pageSize)
      ..writeByte(3)
      ..write(obj.totalPages)
      ..writeByte(4)
      ..write(obj.totalElements)
      ..writeByte(5)
      ..write(obj.lastPage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BlogPostAdapter extends TypeAdapter<BlogPost> {
  @override
  final int typeId = 2;

  @override
  BlogPost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogPost(
      postId: fields[0] as int,
      title: fields[1] as String,
      image: fields[2] as String,
      content: fields[3] as String,
      addedDate: fields[4] as String,
      category: fields[5] as Category,
      author: fields[6] as Author,
      comments: (fields[7] as List).cast<Comment>(),
    );
  }

  @override
  void write(BinaryWriter writer, BlogPost obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.postId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.addedDate)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.author)
      ..writeByte(7)
      ..write(obj.comments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogPostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 3;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      categoryId: fields[0] as int,
      categoryTitle: fields[1] as String,
      categoryDescription: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.categoryId)
      ..writeByte(1)
      ..write(obj.categoryTitle)
      ..writeByte(2)
      ..write(obj.categoryDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AuthorAdapter extends TypeAdapter<Author> {
  @override
  final int typeId = 4;

  @override
  Author read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Author(
      id: fields[0] as int,
      name: fields[1] as String,
      email: fields[2] as String,
      about: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Author obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.about);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CommentAdapter extends TypeAdapter<Comment> {
  @override
  final int typeId = 5;

  @override
  Comment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Comment(
      commentId: fields[0] as int,
      commentText: fields[1] as String,
      commentDate: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Comment obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.commentId)
      ..writeByte(1)
      ..write(obj.commentText)
      ..writeByte(2)
      ..write(obj.commentDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
