import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_and_morty/data/models/location_resident_model.dart';
import 'package:rick_and_morty/presentation/resources/strings_manager.dart';

import '../../data/models/chracters_model.dart';
import '../../data/web_services/dio_helper/dio_helper.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitial());

  static CharactersCubit get(context)=>BlocProvider.of(context);
  late CharactersModel charactersModel;
  late LocationResidentModel locationResidentModel;
   List<LocationResidentModel> residentsList = [];
  int currentPage = 1 ;
  late int pageLimit;
  List<Results> charList = [];
  List<Results> searchedCharList = [];
  final RefreshController refreshController = RefreshController();
  int currentIndex=1;
  var success = false;
  bool isSearch= false;

  getCharactersInfo({bool isRefresh=false , String? query} )async{
      if(isRefresh){
        currentPage = 1;
      }
     emit(GetCharDataState());
      query == null ?
     DioHelper.getData(url: 'https://rickandmortyapi.com/api/character/?page=$currentPage').then((value){
      charactersModel =CharactersModel.fromJson(value?.data);
      if(isRefresh){
        charList = charactersModel.results;
      }
      else{
        charList.addAll(charactersModel.results);
      }
      pageLimit = charactersModel.info.pages;
      currentPage ++;
      success = true;
      emit(GotCharDataSuccessState());
      return true;

    }).catchError((e){
      emit(GotCharDataErrorState());
      success = false;
      return e;

    }) : DioHelper.getData(url: UrlManager.characterEndPoint,query: {'name': query}).then((value){
        isSearch = true;
        charactersModel =CharactersModel.fromJson(value?.data);
        searchedCharList = charactersModel.results;
        emit(GotCharDataSuccessState());
        return true;

      }).catchError((e){
        emit(GotCharDataErrorState());
        return e;
      }) ;

  }

  void onRefresh()async{

        await getCharactersInfo(isRefresh: true);
        if(success){
          refreshController.refreshCompleted();
        }else{
          refreshController.refreshFailed();
        }



  }
  void onLoading()async{
    await getCharactersInfo();
    if(success){
      refreshController.loadComplete();
    }else{
      refreshController.loadFailed();
    }

  }

  getLocationCharactersInfo(List<String> urls)async{
    emit(GetCharDataState());

    for (String url in urls) {
     await DioHelper.getData(url: url).then((value){
      locationResidentModel =  LocationResidentModel.fromJson(value?.data);
        residentsList.add(locationResidentModel);
        emit(GotCharDataSuccessState());
      }).catchError((e){
        emit(GotCharDataErrorState());
        return e;

      });
    }
  }



}
