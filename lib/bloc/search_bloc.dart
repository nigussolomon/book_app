import 'package:bloc/bloc.dart';

import 'package:book_app/bloc/search_event.dart';
import 'package:book_app/bloc/search_state.dart';
import 'package:book_app/data/Api_service.dart';
import 'package:book_app/data/book.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState()) {
    on<SearchEvent>(
      (event, emit) async {
        if (event is SubmitSearchEvent) {
          emit(SearchLoadingState());
          try {
            if (event.param.isEmpty) {
              final List<Book> books = await Service.fetchBooks();
              emit(SearchSuccessState(books));
            } else {
              // print(event.param);
              List<Book?> books = await Service.searchBooks(event.param);
              emit(SearchSuccessState(books));
            }
          } catch (e) {
            emit(SearchErrorState(e.toString()));
          }
        }
      },
    );
  }
}
