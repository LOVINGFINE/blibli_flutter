import 'package:dio/dio.dart';
class JSONConversion {
  static T generateOBJ<T>(json) {
    if (json == null) {
      return null;
    } else {
      return json as T;
    }
  }
}
// data:{} 转换
class BaseEntity<T> {
  int code;
  String message;
  T data;

  BaseEntity({this.code, this.message, this.data});

  factory BaseEntity.fromJson(json) {
    return BaseEntity(
      code: json["code"],
      message: json["msg"],
      // data值需要经过工厂转换为我们传进来的类型
      data: JSONConversion.generateOBJ<T>(json["data"]),
    );
  }
}

// data:[] 转换
class BaseListEntity<T> {
  int code;
  String message;
  List<T> data;
  BaseListEntity({this.code, this.message, this.data});
  factory BaseListEntity.fromJson(json) {
    List<T> mData = List();
    if (json['data'] != null) {
      //遍历data并转换为我们传进来的类型
      (json['data'] as List).forEach((v) {
        mData.add(JSONConversion.generateOBJ<T>(v));
      });
    }

    return BaseListEntity(
      code: json["code"],
      message: json["msg"],
      data: mData,
    );
  }
}
class ErrorEntity {
  int code;
  String message;
  ErrorEntity({this.code, this.message});
}
// error metods
ErrorEntity createErrorEntity(DioError error) {
  switch (error.type) {
    case DioErrorType.CANCEL:
      {
        return ErrorEntity(code: -1, message: "请求取消");
      }
      break;
    case DioErrorType.CONNECT_TIMEOUT:
      {
        return ErrorEntity(code: -1, message: "连接超时");
      }
      break;
    case DioErrorType.SEND_TIMEOUT:
      {
        return ErrorEntity(code: -1, message: "请求超时");
      }
      break;
    case DioErrorType.RECEIVE_TIMEOUT:
      {
        return ErrorEntity(code: -1, message: "响应超时");
      }
      break;
    case DioErrorType.RESPONSE:
      {
        try {
          int errCode = error.response.statusCode;
          String errMsg = error.response.statusMessage;
         switch (errCode) {
           case 400: {
             return ErrorEntity(code: errCode, message: "请求语法错误");
           }
           break;
           case 403: {
             return ErrorEntity(code: errCode, message: "服务器拒绝执行");
           }
           break;
           case 404: {
             return ErrorEntity(code: errCode, message: "无法连接服务器");
           }
           break;
           case 405: {
             return ErrorEntity(code: errCode, message: "请求方法被禁止");
           }
           break;
           case 500: {
             return ErrorEntity(code: errCode, message: "服务器内部错误");
           }
           break;
           case 502: {
             return ErrorEntity(code: errCode, message: "无效的请求");
           }
           break;
           case 503: {
             return ErrorEntity(code: errCode, message: "服务器挂了");
           }
           break;
           case 505: {
             return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
           }
           break;
           default: {
             return ErrorEntity(code: errCode, message: "未知错误");
           }
         }
        } on Exception catch (_) {
          return ErrorEntity(code: -1, message: "未知错误");
        }
      }
      break;
    default:
      {
        return ErrorEntity(code: -1, message: error.message);
      }
  }
}
