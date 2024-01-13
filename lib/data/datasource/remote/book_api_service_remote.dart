import 'package:book_app/core/constants/constants.dart';
import 'package:book_app/data/models/book.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'book_api_service_remote.g.dart'; // Add this line

@RestApi(baseUrl: bookApiUrl)
abstract class BookApiServiceRemote {
  factory BookApiServiceRemote(Dio dio) = _BookApiServiceRemote;

  @GET('/books')
  Future<HttpResponse<List<BookModel>>> getBooks();

  @GET('/books/{id}')
  Future<HttpResponse<BookModel>> getBook(String id);

  @POST('/books')
  Future<HttpResponse<BookModel>> addBook(BookModel book);

  @PUT('/books')
  Future<HttpResponse<BookModel>> updateBook(BookModel book);

  @DELETE('/books')
  Future<HttpResponse<BookModel>> deleteBook(String id);
}
