import 'package:dio/dio.dart';

import '../../constants/end_points.dart';

class DioHelper {
  static Dio? dio;



  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }



  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    DioError(requestOptions: RequestOptions(path: ''));

    return await dio!.post(url,queryParameters: query);
  }


  // static Future<Response> getData(
  //     {required String url, required String token ,Map<String,dynamic>? query}) async {
  //   dio!.options.headers = {
  //     //'Connection': 'keep-alive',
  //     'Accept': 'application/json',
  //     'Authorization':'Bearer $token'??'',
  //   };
  //
  //   return await dio!.get(url,queryParameters:query! );
  // }


}