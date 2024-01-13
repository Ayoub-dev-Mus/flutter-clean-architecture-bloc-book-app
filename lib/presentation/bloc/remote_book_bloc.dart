import 'package:book_app/core/resources/data_state.dart';
import 'package:book_app/domain/usecases/get_books.dart';
import 'package:book_app/presentation/bloc/remote_book_event.dart';
import 'package:book_app/presentation/bloc/remote_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteBooksBloc extends Bloc<RemoteBooksEvent, RemoteBooksState> {
  final GetBooksUseCase _getBookUseCase;

  RemoteBooksBloc(this._getBookUseCase) : super(const RemoteBooksLoading()) {
    on<GetBooks>(onGetBooks);
  }

  void onGetBooks(GetBooks event, Emitter<RemoteBooksState> emit) async {
    final dataState = await _getBookUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteBooksDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteBooksError(dataState.error!));
    }
  }
}
