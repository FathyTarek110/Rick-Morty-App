part of 'episodes_cubit.dart';

abstract class EpisodesState {}

class EpisodesInitial extends EpisodesState {}
class GetEpisodesInitial extends EpisodesState {}
class GotEpisodesSuccess extends EpisodesState {}
class GotEpisodesFailed extends EpisodesState {}
