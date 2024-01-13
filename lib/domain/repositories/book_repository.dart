import 'package:book_app/core/resources/data_state.dart';
import 'package:book_app/domain/entities/book.dart';

abstract class BookRepository {
  Future<DataState<List<BookEntity>>> getBooks();
  Future<DataState<BookEntity>> getBook(String id);
  Future<DataState<BookEntity>> addBook(BookEntity book);
  Future<DataState<BookEntity>> updateBook(BookEntity book);
  Future<DataState<BookEntity>> deleteBook(String id);
}
