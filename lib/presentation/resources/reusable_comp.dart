import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/location_resident_model.dart';
import 'package:rick_and_morty/presentation/resources/values_manager.dart';

import '../../data/models/chracters_model.dart';
import '../character_info_view/character_info.dart';
import 'color_manager.dart';

Padding buildInfo(BuildContext context,String infoTitle,String info) {
  return Padding(
    padding:  const EdgeInsets.all(AppPadding.p16),
    child: Container(
      decoration: BoxDecoration(
          color: ColorManager.whiteGrey,
          borderRadius: BorderRadius.circular(AppSize.s20)
      ),
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Text(infoTitle,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.green),),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Text(info,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.green),softWrap: true,),
            ),
          )

        ],


      ),
    ),
  );
}

GestureDetector buildCharacterCard(BuildContext context ,List<Results> charList,int index) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> CharacterInfo(name :charList[index].name,image: charList[index].image,status: charList[index].status,specie:charList[index].species ,gender:charList[index].gender,origin: charList[index].origin.name,location: charList[index].location.name,)));
    },
    child: Card(
      child: Stack(
          children:[
            Image.network(charList[index].image,fit: BoxFit.cover,),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s14),
                    color: ColorManager.greyOpacity,
                  ),
                  width: double.infinity,

                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(charList[index].name,maxLines: 2,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.white,overflow: TextOverflow.ellipsis,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              ),)

          ] ),
    ),
  );
}


GestureDetector buildLocationCharacterCard(BuildContext context ,List<LocationResidentModel> charList,int index) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> CharacterInfo(name :charList[index].name,image: charList[index].image,status: charList[index].status,specie:charList[index].species ,gender:charList[index].gender,origin: charList[index].origin.name,location: charList[index].location.name,)));
    },
    child: Card(
      child: Stack(
          children:[
            Image.network(charList[index].image,fit: BoxFit.cover,),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s14),
                    color: ColorManager.greyOpacity,
                  ),
                  width: double.infinity,

                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(charList[index].name,maxLines: 2,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.white,overflow: TextOverflow.ellipsis,),textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              ),)

          ] ),
    ),
  );
}