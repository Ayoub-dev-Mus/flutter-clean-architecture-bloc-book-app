import 'dart:io';

import 'package:book_app/core/resources/data_state.dart';
import 'package:book_app/data/datasource/remote/book_api_service_remote.dart';
import 'package:book_app/data/models/book.dart';
import 'package:book_app/domain/entities/book.dart';
import 'package:book_app/domain/repositories/book_repository.dart';
import 'package:dio/dio.dart';

class BookRepositoryImpl implements BookRepository {
  final BookApiServiceRemote _bookApiServiceRemote;
  // final BookApiServiceRemote _bookApiServiceRemote;
  BookRepositoryImpl(this._bookApiServiceRemote);

  @override
  Future<DataState<BookModel>> addBook(BookEntity book) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<BookEntity>> deleteBook(String id) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<BookEntity>> getBook(String id) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<BookEntity>>> getBooks() async {
    try {
      
      final httpResponse = await _bookApiServiceRemote.getBooks();


      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<BookEntity>> updateBook(BookEntity book) {
    // TODO: implement updateBook
    throw UnimplementedError();
  }
}
