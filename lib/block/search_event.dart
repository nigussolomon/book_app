import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {}

class SubmitSearchEvent extends SearchEvent {
  final String param;

  SubmitSearchEvent(this.param);

  @override
  List<Object> get props => [];
}
