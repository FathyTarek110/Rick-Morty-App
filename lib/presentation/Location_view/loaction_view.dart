import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_and_morty/buisness/locations_cubit/locations_cubit.dart';
import 'package:rick_and_morty/presentation/location_info/location_Info.dart';
import 'package:rick_and_morty/presentation/resources/color_manager.dart';
import 'package:rick_and_morty/presentation/resources/values_manager.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key, this.query}) : super(key: key);
  final String? query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LocationsCubit()..getLocationInfo(query: query),
  child: BlocConsumer<LocationsCubit, LocationsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    LocationsCubit cubit = LocationsCubit.get(context);
    return SmartRefresher(
      controller: cubit.refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: (){
        cubit.onRefresh();
      },
      onLoading: (){
        cubit.onLoading();
      },
      child: ListView.separated(
          itemBuilder: (context,index){
            return buildLocationItem(context, index ,cubit.locationList[index].id, cubit.locationList[index].name, cubit.locationList[index].type, cubit.locationList[index].dimension,cubit.locationList[index].residents);
          },
          separatorBuilder: (context, index){
            return Container(
              height: AppSize.s3,
              color: ColorManager.grey,
            );
          },
          itemCount: cubit.locationList.length),
    );
  },
),
);
  }

  GestureDetector buildLocationItem(BuildContext context,int index,int id , String name, String type, String dimension,List<String> locationCharacters) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>LocationInfoView(name: name, type: type, dimension: dimension, residents: locationCharacters,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: CircleAvatar(
                radius: AppSize.s22,
                backgroundColor: ColorManager.primary,
                child: Text(id.toString(),style: Theme.of(context).textTheme.bodyMedium,),
              ),
            ),
            const SizedBox(
              width: AppSize.s16,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('name: $name',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.primary),overflow: TextOverflow.ellipsis,maxLines: 1,softWrap: false,),
                  const SizedBox(
                    height: AppSize.s6,
                  ),
                  Text('Type: $type',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.primary),overflow: TextOverflow.ellipsis,maxLines: 1,softWrap: false,),
                  const SizedBox(
                    height: AppSize.s6,
                  ),
                  Text('dimension: $dimension',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.primary),overflow: TextOverflow.ellipsis,maxLines: 1,softWrap: false,),
                  const SizedBox(
                    height: AppSize.s6,
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
