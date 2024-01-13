import 'package:book_app/domain/entities/book.dart';
import 'package:flutter/foundation.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'book', primaryKeys: ['id'])
class BookModel extends BookEntity {
  BookModel({
    required String id,
    required String title,
    required String author,
    required String description,
    required String imageUrl,
    required String isbn,
    required String publisher,
    required String publishedDate,
    required String category,
    required String language,
    required int pageCount,
  }) : super(
          id: id,
          title: title,
          author: author,
          description: description,
          imageUrl: imageUrl,
          isbn: isbn,
          publisher: publisher,
          publishedDate: publishedDate,
          category: category,
          language: language,
          pageCount: pageCount,
        );

  factory BookModel.fromJson(Map<String, dynamic> map) {
    return BookModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      imageUrl: map['imageUrl'] ?? "",
      isbn: map['isbn'] ?? "",
      publisher: map['publisher'] ?? "",
      publishedDate: map['publishedDate'] ?? "",
      category: map['category'] ?? "",
      language: map['language'] ?? "",
      pageCount: map['pageCount'] ?? 0,
      id: map['id'] ?? "",
    );
  }

  factory BookModel.fromEntity(BookEntity entity) {
    return BookModel(
      id: entity.id,
      title: entity.title,
      language: entity.language,
      author: entity.author,
      publishedDate: entity.publishedDate,
      publisher: entity.publisher,
      pageCount: entity.pageCount,
      category: entity.category,
      description: entity.description,
      imageUrl: entity.imageUrl,
      isbn: entity.isbn,
    );
  }
}
