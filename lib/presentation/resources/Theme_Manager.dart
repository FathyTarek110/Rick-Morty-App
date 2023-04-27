import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty/presentation/resources/color_manager.dart';
import 'package:rick_and_morty/presentation/resources/style_manager.dart';
import 'package:rick_and_morty/presentation/resources/values_manager.dart';

import 'fonts_manger.dart';

ThemeData appTheme(){

  return ThemeData(
    //colors
    primaryColor: ColorManager.primary,
    disabledColor: ColorManager.grey,
    splashColor: ColorManager.lightPrimary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    scaffoldBackgroundColor: ColorManager.white,


    //appbar theme
    appBarTheme: AppBarTheme(
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: ColorManager.primary,
          statusBarIconBrightness: Brightness.light
        ),
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s16)
    ),


    //card theme


    cardTheme: CardTheme(
        clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: AppSize.s3,
      shadowColor: ColorManager.grey,
      color: ColorManager.white,
      margin: const EdgeInsets.all(AppMargin.m8)

    ),

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey,
      splashColor: ColorManager.lightPrimary,
      buttonColor: ColorManager.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        disabledBackgroundColor: ColorManager.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s20),

        )
      )
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.primary
    ),


    //text theme

    textTheme: TextTheme(
      bodyLarge: getSemiBoldStyle(color: ColorManager.white, fontSize: FontSize.s30),
      bodyMedium: getMediumStyle(color: ColorManager.white, fontSize: FontSize.s26),
      bodySmall: getRegularStyle(color: ColorManager.white)

    ),

      inputDecorationTheme:  InputDecorationTheme(
          contentPadding: const EdgeInsets.all(AppPadding.p8),
          hintStyle: getRegularStyle(color: ColorManager.grey,fontSize: FontSize.s14),
          labelStyle: getMediumStyle(color: ColorManager.grey,fontSize: FontSize.s14),
          errorStyle: getRegularStyle(color: ColorManager.error),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.primary,
              width: AppSize.s1_5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),

          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.primary,
              width: AppSize.s1_5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),

          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.error,
              width: AppSize.s1_5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),

          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.error,
              width: AppSize.s1_5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),

          )
      ),

    
    
    //bottom nav theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.primary,
      elevation: AppSize.s4,),
  );
}