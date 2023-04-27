import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/Location_view/loaction_view.dart';
import 'package:rick_and_morty/presentation/characters_view/characters_view.dart';
import 'package:rick_and_morty/presentation/episodes_view/episodes_view.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context)=> BlocProvider.of(context);
  TextEditingController controller = TextEditingController();
  String searchType = 'character' ;
   Widget widget = const Text('no data found');

  assignSearchType(value){
    searchType = value ;
    emit(SearchAssignSearchType());

  }



   Future<Widget>getSearchResult(BuildContext context , String? query) async {
    emit(GetSearchInitial());
    if(searchType == 'character'){

       widget =    CharactersView(query: query,);
       emit(GetSearchSuccessful());
       return widget;

    }
    else if(searchType == 'location'){
      widget =   LocationView(query: controller.value.text,);
      emit(GetSearchSuccessful());
      return widget;
    }
    else if (searchType == 'episode'){
      widget =  EpisodesView(query: controller.value.text,);
      emit(GetSearchSuccessful());
      return widget;
    }else{
      return widget;
    }

  }

  pressSearchButton(BuildContext context){
    emit(StartSearchInitial());
  getSearchResult(context,null);
  emit(EndSearchInitial());

}
}
