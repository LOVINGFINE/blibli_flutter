import 'JSONConversion.dart';
import 'Config.dart';
import 'package:dio/dio.dart';

class DioManager {
  static final DioManager _shared = DioManager._internal();
  factory DioManager() => _shared;
  Dio dio;
  DioManager._internal() {
    if (dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: ConfigBase.baseUrl,
        contentType: ConfigBase.contentType,
        responseType: ConfigBase.responseType,
        receiveDataWhenStatusError: ConfigBase.receiveDataWhenStatusError,
        connectTimeout: ConfigBase.connectTimeout,
        receiveTimeout: ConfigBase.receiveTimeout,
      );
      dio = Dio(options);
    }
  }
  // data:{}
  hanleData<T>(Response response) {
    if (response != null) {
      BaseEntity entity = BaseEntity<T>.fromJson(response.data);
      if (entity.code == 0) {
        return entity.data;
      } else {
        return ErrorEntity(code: entity.code, message: entity.message);
      }
    } else {
      return ErrorEntity(code: -1, message: "未知错误");
    }
  }

  hanleDataList<T>(Response response) {
    if (response != null) {
      BaseListEntity entity = BaseListEntity<T>.fromJson(response.data);
      if (entity.code == 0) {
        return entity.data;
      } else {
        return ErrorEntity(code: entity.code, message: entity.message);
      }
    } else {
      return ErrorEntity(code: -1, message: "未知错误");
    }
  }

  Future getData<T>(String path, {Map params}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params, options: Options(method: DioMethods['get']));
      return this.hanleData(response);
    } on DioError catch (e) {
      return createErrorEntity(e);
    }
  }

  Future getList<T>(String path, {Map params}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params, options: Options(method: DioMethods['get']));
      return this.hanleDataList(response);
    } on DioError catch (e) {
      return createErrorEntity(e);
    }
  }

  Future postData<T>(String path,
      {Map params, Function(T) success, Function(ErrorEntity) error}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params,
          options: Options(method: DioMethods['post']));
      this.hanleData(response);
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  Future postList<T>(String path, {Map params}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params,
          options: Options(method: DioMethods['post']));
      return this.hanleDataList(response);
    } on DioError catch (e) {
      return createErrorEntity(e);
    }
  }

  Future putData<T>(String path,
      {Map params, Function(T) success, Function(ErrorEntity) error}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params, options: Options(method: DioMethods['put']));
      return this.hanleData(response);
    } on DioError catch (e) {
      return createErrorEntity(e);
    }
  }

  Future putList<T>(String path,
      {Map params,
      Function(List<T>) success,
      Function(ErrorEntity) error}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params, options: Options(method: DioMethods['put']));
      return this.hanleDataList(response);
    } on DioError catch (e) {
      return createErrorEntity(e);
    }
  }

  Future deteteData<T>(String path, {Map params}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params,
          options: Options(method: DioMethods['delete']));
      return this.hanleData(response);
    } on DioError catch (e) {
      return createErrorEntity(e);
    }
  }

  Future deleteList<T>(String path, {Map params}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params,
          options: Options(method: DioMethods['delete']));
      return this.hanleDataList(response);
    } on DioError catch (e) {
      return createErrorEntity(e);
    }
  }
}
