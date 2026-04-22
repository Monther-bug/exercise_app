part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchingEvent extends SearchEvent{
  final EcerciseRequest data;
  SearchingEvent(this.data);
}
