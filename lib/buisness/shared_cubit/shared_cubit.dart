import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/Location_view/loaction_view.dart';
import 'package:rick_and_morty/presentation/characters_view/characters_view.dart';
import 'package:rick_and_morty/presentation/episodes_view/episodes_view.dart';
import 'package:rick_and_morty/presentation/resources/strings_manager.dart';


part 'shared_state.dart';

class SharedCubit extends Cubit<SharedState> {
  SharedCubit() : super(SharedInitial());

  static SharedCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    const CharactersView(),
    const LocationView(),
    const EpisodesView(),
  ];
  List<String> titles = [
    StringManager.characterPageTitle,
    StringManager.locationsPageTitle,
    StringManager.episodesPageTitle,
  ];

  void changeIndex(int index){
    currentIndex =index;
    emit(AppChangeBottomNavState());
  }





}
