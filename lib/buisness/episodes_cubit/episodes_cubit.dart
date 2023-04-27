import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_and_morty/data/models/episodes_model.dart';

import '../../data/web_services/dio_helper/dio_helper.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  EpisodesCubit() : super(EpisodesInitial());
  static EpisodesCubit get(context)=> BlocProvider.of(context);
  late EpisodesModel episodesModel;
  int currentPage = 1 ;
  late int pageLimit;
  List<Results> episodesList = [];
  final RefreshController refreshController = RefreshController();
  int currentIndex=1;
  bool success = false;

  getEpisodeInfo({bool isRefresh = false , String? query})async{
    if(isRefresh){
      currentPage = 1;
    }
    emit(GetEpisodesInitial());
    query == null?
    await DioHelper.getData(url: 'https://rickandmortyapi.com/api/episode?page=$currentPage').then((value) {
      episodesModel = EpisodesModel.fromJson(value?.data);
      if(isRefresh){
        episodesList = episodesModel.results;
      }
      else{
        episodesList.addAll(episodesModel.results);
      }

      pageLimit = episodesModel.info.pages;
      currentPage ++;
      success = true;
      emit(GotEpisodesSuccess());
    }).catchError((e) {
      success = false;
      emit(GotEpisodesFailed());

    }):await DioHelper.getData(url: 'https://rickandmortyapi.com/api/episode/$query').then((value) {
      episodesModel = EpisodesModel.fromJson(value?.data);
      if(isRefresh){
        episodesList = episodesModel.results;
      }
      else{
        episodesList.addAll(episodesModel.results);
      }

      pageLimit = episodesModel.info.pages;
      currentPage ++;
      success = true;
      emit(GotEpisodesSuccess());
    }).catchError((e) {
      success = false;
      emit(GotEpisodesFailed());

    });
  }

  void onRefresh()async{

    await getEpisodeInfo(isRefresh: true);
    if(success){
      refreshController.refreshCompleted();
    }else{
      refreshController.refreshFailed();
    }



  }
  void onLoading()async{
    await getEpisodeInfo();
    if(success){
      refreshController.loadComplete();
    }else{
      refreshController.loadFailed();
    }

  }
}
