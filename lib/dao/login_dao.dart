import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_study_flutter/util/navigator_util.dart';
import 'header_util.dart';

class LoginDao {
  static const boardingPass = 'boarding_pass';
  static var saveBoardingPass = '';
  static login({required String userName, required String password}) async {
    Map<String, String> paramsMap = {};
    paramsMap['userName'] = userName;
    paramsMap['password'] = password;
    
    var uri = Uri.https('api.devio.org', '/uapi/user/login', paramsMap);
    final response = await http.post(uri, headers: hiHeaders());
     Utf8Decoder utf8Decoder = const Utf8Decoder();
     String bodyString = utf8Decoder.convert(response.bodyBytes);
     print(bodyString);
     if (response.statusCode == 200) {
       var result = json.decode(bodyString);
       if (result['code'] == 0 && result['data'] != null) {
         _saveBoardingPass(result['data']);
       } else {
         throw Exception(bodyString);
       }
     } else {
       throw Exception(bodyString);
     }
  }

  static void _saveBoardingPass(String value) {
    // 保存本地
    LoginDao.saveBoardingPass = value;
  }

  static String getBoardingPass() {
    return "";
  }

  static logout() {
    NavigatorUtil.goToLogin();
  }
}