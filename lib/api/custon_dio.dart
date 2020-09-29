import 'package:dio/dio.dart';
import 'package:testeweb/api/constant_api.dart';
import 'package:testeweb/api/interceptions.dart';

class CustonDio {
  Dio client = Dio();

  CustonDio() {
    client.options.baseUrl = ConstantApi.urlList;

    client.interceptors.add(CustonInterceptions());
    client.options.connectTimeout = 5000;
    //client.options.contentType= Headers.formUrlEncodedContentType;

  }
}
