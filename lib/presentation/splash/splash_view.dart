import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty/presentation/resources/values_manager.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {


  late final AnimationController _controller =AnimationController(
    duration: const Duration(milliseconds: 3000), vsync: this,);
  double textOpacity = 0;

  //init state
  @override
  void initState() {
          super.initState();
          rollMultipleTimes();
          textOnStart();
          goNext();
  }



  //dispose
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/3,
                    child: Image.asset('assets/images/logo.png')),
              ),
            ),
            AnimatedOpacity(
              opacity: textOpacity,
              duration: const Duration(seconds: 2),
              curve: Curves.linear,
              child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/7,
                  child: Image.asset('assets/images/text.png')),
            ),
          ],
        ),
      )
    );
  }

  Timer goNext(){
    return Timer(const Duration(seconds: AppTime.s6), () {
      setState(() {
        Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
      });
    });
  }

  Timer textOnStart(){
   return Timer( const Duration(seconds: AppTime.s1), () {
      setState(() {
        textOpacity = 1;
      });
    });
  }

  rollMultipleTimes(){
    for(int i = 0 ; i <=3 ; i++){
      _controller.forward();
    }
  }
}
