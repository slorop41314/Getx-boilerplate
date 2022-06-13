import 'package:dio/dio.dart';
import 'package:getx_boilerplate/core/constant/constant.dart';

extension ErrorExtension on Object {
  String get message {
    final _this = this;
    print(_this);
    if (_this is DioError) {
      print('hereee');
      if (_this.type == DioErrorType.connectTimeout) {
        return CommonConstant.MESSAGE_TIMEOUT;
      }
      if (_this.type == DioErrorType.other) {
        return CommonConstant.MESSAGE_UNKNOWN_ERROR;
      }
      return _this.message;
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
