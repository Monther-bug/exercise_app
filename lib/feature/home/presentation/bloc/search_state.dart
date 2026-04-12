part of 'search_bloc.dart';

@immutable
class SearchState {

  // SearchState copyWith({
  //   List<ExerciseEntity>? data
  // }){
  //   return SearchState(data: data?? this.data);
  // }
}

final class SearchInitial extends SearchState {
  //SearchInitial(): super(data: []);
}
final class SearchLoading extends SearchState {
  //SearchLoading(): super(data: []);
}


final class SearchEmpty extends SearchState {
  //SearchEmpty(): super(data: []);
}

final class SearchSuccessful extends SearchState{
  //SearchSuccessful(): super(data : )
  final  List<ExerciseEntity> data;
  SearchSuccessful({required this.data});
  SearchSuccessful copyWith({
    List<ExerciseEntity>? data
  }){
    return SearchSuccessful(data: data?? this.data);
  }
}

final class Searchfailed extends SearchState {
  final String message;
  Searchfailed(this.message);
}

// final class SearchFailed extends SearchState{

// }




