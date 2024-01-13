import 'package:book_app/domain/entities/book.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class RemoteBooksState extends Equatable {
  final List<BookEntity>? books;
  final DioException? error;

  const RemoteBooksState({this.books, this.error});

  @override
  List<Object> get props => [books!, error!];
}

class RemoteBooksLoading extends RemoteBooksState {
  const RemoteBooksLoading();
}

class RemoteBooksDone extends RemoteBooksState {
  const RemoteBooksDone(List<BookEntity> book) : super(books: book);
}

class RemoteBooksError extends RemoteBooksState {
  const RemoteBooksError(DioException error) : super(error: error);
}
