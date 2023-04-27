import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_and_morty/presentation/resources/values_manager.dart';
import '../../buisness/characters_cubit/characters_cubit.dart';
import '../resources/reusable_comp.dart';

class CharactersView extends StatelessWidget {
   const CharactersView({Key? key, this.query}) : super(key: key);
  final String? query;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
  create: (context) => CharactersCubit()..getCharactersInfo(query: query),
  child: BlocConsumer<CharactersCubit, CharactersState>(
  listener: (context, state) {
    // TODO: implement listener

  },
  builder: (context, state) {

    CharactersCubit cubit = CharactersCubit.get(context);
    return SmartRefresher(
      controller: cubit.refreshController,
      enablePullDown: false,
      enablePullUp: cubit.isSearch == true ? false: true,
      onRefresh: (){
        cubit.onRefresh();
      },
      onLoading: (){
        cubit.onLoading();
      },
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: cubit.isSearch == true ? cubit.searchedCharList.length  : cubit.charList.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(AppPadding.p14),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: AppSize.s4,
              mainAxisSpacing: AppSize.s4),
          itemBuilder: (context,index){
          if(cubit.isSearch == true){
            return buildCharacterCard(context, cubit.searchedCharList,index);
          }else{
            return buildCharacterCard(context, cubit.charList,index);
          }

          }),
    );
  },
),
);
  }





}