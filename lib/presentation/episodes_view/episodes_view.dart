import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_and_morty/buisness/episodes_cubit/episodes_cubit.dart';
import 'package:rick_and_morty/presentation/episodes_info/episodes_info.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class EpisodesView extends StatelessWidget {
  const EpisodesView({super.key, this.query});
  final String? query ;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => EpisodesCubit()..getEpisodeInfo(),
  child: BlocConsumer<EpisodesCubit, EpisodesState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    EpisodesCubit cubit = EpisodesCubit.get(context);
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
            return buildEpisodeItem(context, index ,cubit.episodesList[index].id, cubit.episodesList[index].name, cubit.episodesList[index].airDate, cubit.episodesList[index].episode,cubit.episodesList[index].characters);
          },
          separatorBuilder: (context, index){
            return Container(
              height: AppSize.s3,
              color: ColorManager.grey,
            );
          },
          itemCount: cubit.episodesList.length),
    );
  },
),
);
  }

  GestureDetector buildEpisodeItem(BuildContext context,int index,int id , String name, String airDate, String episode,List<String> episodeCharacters) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>EpisodesInfoView(name: name, airDate: airDate,episode: episode ,episodeCharacters: episodeCharacters,)));
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
                  Text('air date: $airDate',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.primary),overflow: TextOverflow.ellipsis,maxLines: 1,softWrap: false,),
                  const SizedBox(
                    height: AppSize.s6,
                  ),
                  Text('episode: $episode',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.primary),overflow: TextOverflow.ellipsis,maxLines: 1,softWrap: false,),
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