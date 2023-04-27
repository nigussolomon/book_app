import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/Api_service.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  // final _ServiceProvider = Service();
  List favorite = [];
  // List favoriteLoad = [];
  FavoritesBloc() : super(FavoritesInitial()) {
    on<FavoritesFetchEvent>((event, emit) async {
      emit(FavoritesLoading());
      try {
        final activity = await Service.fetchBooks();
        emit(FavoritesSuccess(favorite: activity));
      } catch (e) {
        emit(FavoritesFailed());
      }
    });
  }
}
