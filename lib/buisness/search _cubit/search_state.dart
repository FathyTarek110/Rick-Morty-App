part of 'search_cubit.dart';


abstract class SearchState {}

class SearchInitial extends SearchState {}
class StartSearchInitial extends SearchState {}
class EndSearchInitial extends SearchState {}
class SearchAssignSearchType extends SearchState {}
class GetSearchInitial extends SearchState {}
class GetSearchSuccessful extends SearchState {}
class GetSearchFailed extends SearchState {}


