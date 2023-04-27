
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/buisness/characters_cubit/characters_cubit.dart';
import 'package:rick_and_morty/presentation/resources/color_manager.dart';
import '../resources/reusable_comp.dart';
import '../resources/values_manager.dart';

class CharacterInfo extends StatelessWidget {
  final String name;
  final String image;
  final String status;
  final String specie;
  final String gender;
  final String origin;
  final String location;
  const CharacterInfo({Key? key, required this.name, required this.image, required this.status, required this.specie, required this.gender, required this.origin, required this.location}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersCubit(),
      child: BlocConsumer<CharactersCubit, CharactersState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,

            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/2,
                      child: Image.network(image,fit: BoxFit.cover,)),
                  Container(

                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/2,

                    decoration: BoxDecoration(
                        color: ColorManager.primary,
                        border: Border.all(color: ColorManager.lightGrey,width: AppSize.s1_5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(name,style: Theme.of(context).textTheme.bodyLarge),
                            buildInfo(context,'status :',status),
                            buildInfo(context,'specie :',specie),
                            buildInfo(context,'gender :',gender),
                            buildInfo(context,'origin :',origin),
                            buildInfo(context,'location :',location),

                          ],
                        ),
                      ),
                    ),
                  )
                ],

              ),
            ),
          );
        },
      ),
    );
  }


}
