import 'package:book_app/data/book.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {}

class SearchInitialState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoadingState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchSuccessState extends SearchState {
  final List<Book?> books;

  SearchSuccessState(this.books);

  @override
  List<Object> get props => [];
}

class SearchErrorState extends SearchState {
  final String error;

  SearchErrorState(this.error);

  @override
  List<Object> get props => [];
}

class SearchEmptyState extends SearchState {
  final String error;

  SearchEmptyState(this.error);

  @override
  List<Object> get props => [];
}
