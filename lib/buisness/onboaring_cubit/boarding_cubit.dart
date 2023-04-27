import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/data/models/onBoardingModel.dart';
import 'package:rick_and_morty/presentation/resources/strings_manager.dart';


part 'boarding_state.dart';

class BoardingCubit extends Cubit<BoardingState> {
  BoardingCubit() : super(BoardingInitial());
  static BoardingCubit get(context) => BlocProvider.of(context);
  List<BoardingModel> boardingItems = [
    BoardingModel(image: 'assets/images/landingOne.png', text: StringManager.onBoarding1),
    BoardingModel(image: 'assets/images/landingtwo.png', text: StringManager.onBoarding2),
    BoardingModel(image: 'assets/images/landingthree.png', text: StringManager.onBoarding3)
  ];

  bool isLast = false;

  void reachLastPage(){

    isLast = true;
    emit(LastBoardingPage());
  }

  void notLastPage(){

    isLast = false;
    emit(NotLastBoardingPage());
  }



}
