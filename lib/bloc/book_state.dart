part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookSuccess extends BookState {
  final List book;

  const BookSuccess({required this.book});
}

class BookFailed extends BookState {}

class BookEmpty extends BookState {}
