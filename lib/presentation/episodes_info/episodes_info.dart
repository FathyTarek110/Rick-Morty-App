import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../buisness/characters_cubit/characters_cubit.dart';
import '../resources/color_manager.dart';
import '../resources/reusable_comp.dart';
import '../resources/values_manager.dart';

class EpisodesInfoView extends StatelessWidget {
  final String name;
  final String airDate;
  final String episode;
  final List<String> episodeCharacters;
  const EpisodesInfoView({Key? key, required this.name, required this.airDate, required this.episode, required this.episodeCharacters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersCubit()..getLocationCharactersInfo(episodeCharacters),
      child: BlocConsumer<CharactersCubit, CharactersState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          CharactersCubit cubit = CharactersCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(name,style: Theme.of(context).textTheme.bodyLarge,),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: ColorManager.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          buildInfo(context, 'name:', name),
                          buildInfo(context, 'air date:', airDate),
                          buildInfo(context, 'episode:', episode),


                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s12,),
                  Text('Characters',style:  Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorManager.green),),
                  const SizedBox(height: AppSize.s12,),
                  ConditionalBuilder(
                    condition: state is GotCharDataSuccessState,
                    builder: (BuildContext context) {
                      return GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount:cubit.residentsList.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(AppPadding.p14),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: AppSize.s4,
                              mainAxisSpacing: AppSize.s4),
                          itemBuilder: (context,index){
                            return buildLocationCharacterCard(context, cubit.residentsList,index);
                          });
                    },
                    fallback: (BuildContext context) {
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
