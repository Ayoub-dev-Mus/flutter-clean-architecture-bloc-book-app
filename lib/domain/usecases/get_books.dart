import 'package:book_app/core/resources/data_state.dart';
import 'package:book_app/core/usecase/usecase.dart';
import 'package:book_app/domain/entities/book.dart';
import 'package:book_app/domain/repositories/book_repository.dart';

class GetBooksUseCase implements UseCase<DataState<List<BookEntity>>, void> {
  final BookRepository _bookRepository;

  GetBooksUseCase(this._bookRepository);

  @override
  Future<DataState<List<BookEntity>>> call({void params}) {
    return _bookRepository.getBooks();
  }
}
