part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class BookFetchEvent extends BookEvent {
  const BookFetchEvent();

  @override
  List<Object> get props => [];
}
