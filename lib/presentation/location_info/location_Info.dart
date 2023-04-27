import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/buisness/characters_cubit/characters_cubit.dart';
import 'package:rick_and_morty/presentation/resources/color_manager.dart';
import 'package:rick_and_morty/presentation/resources/reusable_comp.dart';
import 'package:rick_and_morty/presentation/resources/values_manager.dart';

class LocationInfoView extends StatelessWidget {
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  const LocationInfoView({Key? key, required this.name, required this.type, required this.dimension, required this.residents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => CharactersCubit()..getLocationCharactersInfo(residents),
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

                    buildInfo(context, 'type:', type),
                    buildInfo(context, 'dimension:', dimension),

                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSize.s12,),
            Text('Residents',style:  Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorManager.green),),
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
