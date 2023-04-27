import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/data/models/onBoardingModel.dart';
import 'package:rick_and_morty/presentation/resources/color_manager.dart';
import 'package:rick_and_morty/presentation/resources/fonts_manger.dart';
import 'package:rick_and_morty/presentation/resources/strings_manager.dart';
import 'package:rick_and_morty/presentation/resources/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../buisness/onboaring_cubit/boarding_cubit.dart';
import '../resources/routes_manager.dart';

class OnBoardingView extends StatelessWidget {
   OnBoardingView({Key? key}) : super(key: key);
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => BoardingCubit(),
  child: BlocConsumer<BoardingCubit, BoardingState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        actions: [
          TextButton(onPressed: (){
            Navigator.pushReplacementNamed(context, Routes.mainLayoutRoute);
          }, child:  Text(StringManager.skip,style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: FontSize.s22,color: ColorManager.primary),)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              //indicator
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmoothPageIndicator(
                      controller: pageController,  // PageController
                      count:  BoardingCubit.get(context).boardingItems.length,
                      effect:   WormEffect(
                          spacing:  10.0,
                          radius:  50.0,
                          dotWidth:  15.0,
                          dotHeight:  15.0,
                          paintStyle:  PaintingStyle.stroke,
                          strokeWidth:  1.5,
                          dotColor:  ColorManager.lightGrey,
                          activeDotColor:  ColorManager.primary
                      ),  // your preferred effect
                  )
                ],
              ),

              const SizedBox(
                height: AppSize.s30,
              ),
              Expanded(
                  
                  child:PageView.builder(
                      physics:const BouncingScrollPhysics() ,
                      controller: pageController,
                      itemCount: BoardingCubit.get(context).boardingItems.length,
                      itemBuilder: (context,index)=>buildBoardingItem(context,BoardingCubit.get(context).boardingItems[index]),
                      onPageChanged: (int index){
                        if(index == BoardingCubit.get(context).boardingItems.length -1){
                          BoardingCubit.get(context).reachLastPage();
                        }
                        else{
                          BoardingCubit.get(context).notLastPage();
                        }
                      },),
              
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(onPressed: (){
                    if(BoardingCubit.get(context).isLast == true){
                      Navigator.pushReplacementNamed(context, Routes.mainLayoutRoute);
                    }else{
                      pageController.nextPage(duration: const Duration(milliseconds: AppTime.ms500), curve: Curves.easeInToLinear);

                    }
                  },child:  Icon(Icons.arrow_forward_ios_rounded,color: ColorManager.white,),)
                ],
              )
            ],
          ),
        ),
      )
    );
  },
),
);
  }

  Column buildBoardingItem(BuildContext context,BoardingModel model) {
    return Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/2,
                    child: Image.asset(model.image)),
                const SizedBox(height: AppSize.s16,),
                Text(model.text,style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManager.darkGrey),),
              ],
            );
  }
}