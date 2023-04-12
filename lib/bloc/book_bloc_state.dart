part of 'book_bloc_bloc.dart';

abstract class BookBlocState extends Equatable {
  const BookBlocState();
  
  @override
  List<Object> get props => [];
}

class BookBlocInitial extends BookBlocState {}
