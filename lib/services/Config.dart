import 'package:dio/dio.dart';
enum EnumMethods {
  GET,
  POST,
  PUT,
  DETETE,
}

const DioMethods = {
  EnumMethods.GET: "get",
  EnumMethods.POST: "post",
  EnumMethods.PUT: "put",
  EnumMethods.DETETE: "delete"
};

class ConfigBase {
  static final baseUrl = "https://app.bilibili.com/";
  static final contentType = Headers.jsonContentType;
  static final responseType = ResponseType.json;
  static final receiveDataWhenStatusError =false;
  static final connectTimeout = 30000;
  static final receiveTimeout =3000;
}
