import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;
  final String isbn;
  final String publisher;
  final String publishedDate;
  final String category;
  final String language;
  final int pageCount;

  BookEntity({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
    required this.isbn,
    required this.publisher,
    required this.publishedDate,
    required this.category,
    required this.language,
    required this.pageCount,
  });

  @override
  List<Object> get props => [
        id,
        title,
        author,
        description,
        imageUrl,
        isbn,
        publisher,
        publishedDate,
        category,
        language,
        pageCount,
      ];
}
