import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_and_morty/data/models/location_model.dart';
import 'package:rick_and_morty/data/web_services/dio_helper/dio_helper.dart';
part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit() : super(LocationsInitial());

  static LocationsCubit get(context)=> BlocProvider.of(context);
  late LocationModel locationModel;
  int currentPage = 1 ;
  late int pageLimit;
  List<Results> locationList = [];
  final RefreshController refreshController = RefreshController();
  int currentIndex=1;
  bool success = false;

  getLocationInfo({bool isRefresh = false , String? query })async{
    if(isRefresh){
      currentPage = 1;
    }
    emit(GetLocationsInitial());
    query == null ?
   await DioHelper.getData(url: 'https://rickandmortyapi.com/api/location?page=$currentPage').then((value) {
      locationModel = LocationModel.fromJson(value?.data);
      if(isRefresh){
        locationList = locationModel.results;
      }
      else{
        locationList.addAll(locationModel.results);
      }
      pageLimit = locationModel.info.pages;
      currentPage ++;
      success = true;
      emit(GotLocationsSuccess());
    }).catchError((e) {
      success = false;
      emit(GotLocationsFailed());

    }) : await DioHelper.getData(url: 'https://rickandmortyapi.com/api/location/$query').then((value) {
      locationModel = LocationModel.fromJson(value?.data);
      if(isRefresh){
        locationList = locationModel.results;
      }
      else{
        locationList.addAll(locationModel.results);
      }
      pageLimit = locationModel.info.pages;
      currentPage ++;
      success = true;
      emit(GotLocationsSuccess());
    }).catchError((e) {
      success = false;
      emit(GotLocationsFailed());

    });
  }

  void onRefresh()async{

    await getLocationInfo(isRefresh: true);
    if(success){
      refreshController.refreshCompleted();
    }else{
      refreshController.refreshFailed();
    }



  }
  void onLoading()async{
     await getLocationInfo();
    if(success){
      refreshController.loadComplete();
    }else{
      refreshController.loadFailed();
    }

  }

}
