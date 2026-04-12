part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchingEvent extends SearchEvent{
  final String data;
  SearchingEvent(this.data);
}
