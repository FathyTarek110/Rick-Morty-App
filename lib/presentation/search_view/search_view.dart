import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/buisness/search%20_cubit/search_cubit.dart';
import 'package:rick_and_morty/presentation/resources/color_manager.dart';
import 'package:rick_and_morty/presentation/resources/values_manager.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          SearchCubit cubit = SearchCubit.get(context);

          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed:() {
              cubit.getSearchResult(context,null);

            },
              child: const Icon(Icons.search_outlined),
            ),
            appBar: AppBar(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: TextFormField(
                    onChanged: (value){
                      cubit.getSearchResult(context,value);
                    },
                    controller:cubit.controller,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: ColorManager.lightGrey,),
                        label: const Text('Search')
                    ),
                  ),


                ),
                Text('you are searching for',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManager.lightGrey),),
                const SizedBox(height: AppSize.s8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [

                        Radio(value: 'character', groupValue: cubit.searchType, onChanged: (value){
                          cubit.assignSearchType(value);
                        }),
                         Text('character',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManager.lightGrey ),),
                      ],
                    ),
                    Row(
                      children: [

                        Radio(value: 'location', groupValue: cubit.searchType, onChanged: (value){
                          cubit.assignSearchType(value);
                        }),
                         Text('location',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManager.lightGrey ),),
                      ],
                    ),Row(
                      children: [
                        Radio(value: 'episode', groupValue: cubit.searchType, onChanged: (value){
                          cubit.assignSearchType(value);
                        }),
                         Text('episode',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManager.lightGrey ),),
                      ],
                    ),

                  ],
                ),
                const SizedBox(height: 10,),
                Expanded(child: cubit.widget)

              ],
            ),
          );
        },
      ),
    );
  }
}
