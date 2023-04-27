part of 'locations_cubit.dart';

abstract class LocationsState {}

class LocationsInitial extends LocationsState {}

class GetLocationsInitial extends LocationsState {}
class GotLocationsSuccess extends LocationsState {}
class GotLocationsFailed extends LocationsState {}
