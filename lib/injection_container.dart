import 'package:book_app/data/datasource/remote/book_api_service_remote.dart';
import 'package:book_app/data/repository/book_repository_impl.dart';
import 'package:book_app/domain/repositories/book_repository.dart';
import 'package:book_app/domain/usecases/get_books.dart';
import 'package:book_app/presentation/bloc/remote_book_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<BookApiServiceRemote>(BookApiServiceRemote(sl()));

  sl.registerSingleton<BookRepository>(BookRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetBooksUseCase>(GetBooksUseCase(sl()));
  sl.registerFactory<RemoteBooksBloc>(() => RemoteBooksBloc(sl()));
}
