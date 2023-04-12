import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'book_bloc_event.dart';
part 'book_bloc_state.dart';

class BookBlocBloc extends Bloc<BookBlocEvent, BookBlocState> {
  BookBlocBloc() : super(BookBlocInitial()) {
    on<BookBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
