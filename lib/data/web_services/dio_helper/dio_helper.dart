import 'package:dio/dio.dart';
import 'package:rick_and_morty/presentation/resources/strings_manager.dart';

class DioHelper{
  static late Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: UrlManager.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({required String url ,  Map<String,dynamic>? query})async{
   return await dio.get(url,queryParameters: query);
  }

}