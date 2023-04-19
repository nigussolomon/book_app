import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/Api_service.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final _apiServiceProvider = Service();
  BookBloc() : super(BookInitial()) {
    on<BookEvent>((event, emit) async {
      emit(BookLoading());
      try {
        final bookapi = await _apiServiceProvider.fetchBooks();
        emit(BookSuccess(book: bookapi));
      } catch (e) {
        emit(BookFailed());
      }
    });
  }
}
