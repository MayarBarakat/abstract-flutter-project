import 'dart:convert';

import 'package:flutter/services.dart';


class NativeHelper {
  static NativeHelper? nativeHelper;

  static init() {
    nativeHelper = NativeHelper();
  }

  static const nativeChannel = MethodChannel('server_api/native');

  static sdkInit() async {
    print('Start SDK init');
    String result = await nativeChannel.invokeMethod('sdkInit');
    print('SDK init Successfully ${result}');
  }



  static Future<String> readRFID() async{
    String result = await nativeChannel.invokeMethod('readRFID');
    return result;
  }

  static Future<String> readQR() async{
    String result = await nativeChannel.invokeMethod('readQR');
    print(result);
    return result;
  }

  static Future<String> initDevice() async{
    String result = await nativeChannel.invokeMethod('init');
    print(result);
    return result;
  }
}
