import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Diohelper {
  static Dio? diohelp;
  static init() {
    diohelp = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

  static Future getdata(String method, {@required queries}) async {
    return await diohelp!.get(method, queryParameters: queries);
  }
}
