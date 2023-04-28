import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/Api_service.dart';
import 'package:book_app/utils/errors/errors.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    on<BookEvent>((event, emit) async {
      emit(BookLoading());
      try {
        final bookapi = await Service.fetchBooks();
        emit(BookSuccess(book: bookapi));
      } catch (e) {
        emit(BookFailed(msg: "nobooks"));
      }
    });
  }
}
