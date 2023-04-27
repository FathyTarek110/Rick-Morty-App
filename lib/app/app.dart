import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/resources/Theme_Manager.dart';
import 'package:rick_and_morty/presentation/resources/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: appTheme(),
    );
  }
}
