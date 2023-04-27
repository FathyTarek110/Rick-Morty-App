import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/buisness/shared_cubit/shared_cubit.dart';
import 'package:rick_and_morty/presentation/resources/color_manager.dart';
import 'package:rick_and_morty/presentation/resources/strings_manager.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
  create: (context) => SharedCubit(),
  child: BlocConsumer<SharedCubit, SharedState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    SharedCubit cubit = SharedCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(cubit.titles[cubit.currentIndex],style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorManager.white),),
        actions: const [
          // IconButton(onPressed: (){
          // Navigator.pushNamed(context, Routes.searchRoute);
          // }, icon:  Icon(Icons.search_outlined,color: ColorManager.white,))
        ],
      ),
      body: cubit.screens[cubit.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorManager.white,
        unselectedItemColor: ColorManager.darkGrey,
        onTap: (index){
          cubit.changeIndex(index);
        },
        currentIndex: cubit.currentIndex,
        items: [
          BottomNavigationBarItem(icon: buildBottomCheatContainer('assets/images/bottomnavone.png'),label: StringManager.character),
          BottomNavigationBarItem(icon: buildBottomCheatContainer('assets/images/bottomnavthree.png'),label: StringManager.locations),
          BottomNavigationBarItem(icon: buildBottomCheatContainer('assets/images/bottomnavtwo.png'),label: StringManager.episodes),

        ],
      ),
    );
  },
),
);
  }

  SizedBox buildBottomCheatContainer(String image) {
    return SizedBox(
          height: 35,
          width: 40,
            child: Image.asset(image));
  }
}
