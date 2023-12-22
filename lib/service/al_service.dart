import 'dart:convert';
import 'package:almaren/model/service_result.dart';
import 'package:http/http.dart' as http;

class AlService {
  static const String appServerAddress = 'http://wildfirechat.net:8888';

  //登录授权信息
  static Map<String, String> headers = <String, String>{
    "Authorization": token,
    "authorization": token,
  };

  static String token =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJndWFyZCI6ImFwaSIsImlzcyI6ImltLndlYiIsImV4cCI6MTcyNDgyNjkzOCwiaWF0IjoxNjg4ODI2OTM4LCJqdGkiOiIyMDU0In0.HrMqAKCHxCMCZNxIe0uMH7NXnq6RH7Wxs4FfRg6bkE8";

  static Future<http.Response> get(Uri url) async {
    return await http.get(url, headers: headers);
  }

  static Future<http.Response> post(
    String request,
    String json,
  ) {
    var url = appServerAddress + request;
    // print(json);
    return http.post(Uri.parse(url), // post地址
        headers: {"content-type": "application/json"}, //设置content-type为json
        body: json //json参数
        );
  }

  //发送验证码
  static Future<ServiceResult> sendCode(String phone) async {
    ServiceResult result = ServiceResult();
    String jsonStr = json.encode({'mobile': phone});
    var response = await post('/send_code', jsonStr);
    Map<dynamic, dynamic> map = json.decode(response.body);
    if (map['code'] == 0) {
      result.success = true;
    } else {
      result.msg = map['message'] ?? '网络错误';
    }
    return result;
  }

  //登录账号
  static Future<ServiceResult> login(String phone, String code) async {
    ServiceResult result = ServiceResult();
    String jsonStr = json.encode({
      'mobile': phone,
      'code': code,
      //'clientId': await Imclient.clientId,
      'platform': 2
    });
    var response = await post('/login', jsonStr);
    Map<dynamic, dynamic> map = json.decode(response.body);
    if (map['code'] == 0) {
      //Map<dynamic, dynamic> data = map['result'];
      // String userId = data['userId'];
      // String token = data['token'];
      //bool newUser = data['register'];
      //IMService.connect(userId, token);
      result.success = true;
    } else {
      result.msg = map['message'] ?? '网络错误';
    }
    return result;
  }
}
