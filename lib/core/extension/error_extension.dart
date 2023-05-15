import 'package:dio/dio.dart';
import 'package:getx_boilerplate/core/constant/constant.dart';

extension ErrorExtension on Object {
  String get message {
    final _this = this;
    if (_this is DioError) {
      if (_this.type == DioErrorType.connectionTimeout) {
        return CommonConstant.MESSAGE_TIMEOUT;
      }
      if (_this.type == DioErrorType.unknown) {
        return CommonConstant.MESSAGE_UNKNOWN_ERROR;
      }
      return _this.message ?? CommonConstant.MESSAGE_UNKNOWN_ERROR;
    }
    if (_this is Exception) {
      return _this.toString().replaceAll("Exception: ", "");
    }
    if (_this is Response) {
      return _this.data['message'];
    }
    return toString();
  }
}
