import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/web_services/dio_helper/dio_helper.dart';

import 'app/app.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}




