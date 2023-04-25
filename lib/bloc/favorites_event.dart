part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesFetchEvent extends FavoritesEvent {
  const FavoritesFetchEvent();

  @override
  List<Object> get props => [];
}

class FavoriteEvent extends FavoritesEvent {
  final FavoritesBloc favorite;
  const FavoriteEvent({required this.favorite});

  @override
  List<Object> get props => [];

  get data => favorite;
}
