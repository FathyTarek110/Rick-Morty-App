import 'package:flutter/material.dart';

import 'package:rick_and_morty/presentation/resources/fonts_manger.dart';

TextStyle? _getTextStyle( double fontSize,String fontFamily,FontWeight fontWeight,Color color){
    return TextStyle(color: color ,fontFamily: fontFamily,fontWeight: fontWeight,fontSize: fontSize);
}


TextStyle? getRegularStyle({required Color color,double? fontSize}){
  return _getTextStyle(fontSize ??FontSize.s18,FontConstants.bangers ,FontWeightManager.regular, color,);
}


TextStyle?getMediumStyle({required Color color,required double fontSize}){
  return _getTextStyle(fontSize,FontConstants.bangers , FontWeightManager.medium, color,);
}

TextStyle? getSemiBoldStyle({required Color color,required double fontSize}){
  return _getTextStyle(fontSize,FontConstants.bangers , FontWeightManager.semiBold, color,);
}