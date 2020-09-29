import 'dart:io';

import 'package:dio/dio.dart';
import 'package:testeweb/api/constant_api.dart';
import 'package:testeweb/api/custon_dio.dart';
import 'package:testeweb/core/model/categoria.dart';
import 'package:testeweb/core/model/estado.dart';

class EstadoRepository {
  CustonDio dio = CustonDio();

  Future<List<Estado>> getAllById(int id) async {
    try {
      print("carregando estados by id");
      var response = await dio.client.get("/estados/${id}");
      return (response.data as List)
          .map((c) => Estado.fromJson(c))
          .toList();
    } on DioError catch (e) {
      print(e.message);
    }
    return null;
  }

  Future<List<Estado>> getAll() async {
    try {
      print("carregando estados");
      var response = await dio.client.get("/estados");
      return (response.data as List)
          .map((c) => Estado.fromJson(c))
          .toList();
    } on DioError catch (e) {
      print(e.message);
    }
    return null;
  }

  Future<int> create(Map<String, dynamic> data) async {
    try {
      var response = await dio.client.post("/estados/create", data: data);
      return response.statusCode;
    } on DioError catch (e) {
      print(e.message);
    }
    return null;
  }

  Future<int> update(Map<String, dynamic> data, int id) async {
    try {
      var response = await dio.client.patch("/estados/$id", data: data);
      return response.statusCode;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  static Future<FormData> upload(File file, String fileName) async {
    var arquivo = file.path;
    var fileDir = file.path;

    var paramentros = {
      "file": await MultipartFile.fromFile(fileDir, filename: fileName)
    };

    FormData formData = FormData.fromMap(paramentros);

    var response = await Dio()
        .post(ConstantApi.urlList + "/estados/upload", data: formData);
    print("RESPONSE: $response");
    print("fileDir: $fileDir");
    return formData;
  }
}
