part of 'characters_cubit.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
class GetCharDataState extends CharactersState {}
class GotCharDataSuccessState extends CharactersState {
}
class GotCharDataErrorState extends CharactersState {}

class RefreshCharDataSuccessState extends CharactersState {}
class RefreshCharDataErrorState extends CharactersState {}
class RefreshCharDataMaxState extends CharactersState {}

class LoadingCharDataSuccessState extends CharactersState {}
class LoadingCharDataErrorState extends CharactersState {}


class UpdateIndexSuccessState extends CharactersState {}
