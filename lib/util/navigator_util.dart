import 'package:flutter/material.dart';
import 'package:my_study_flutter/pages/home_page.dart';
import 'package:my_study_flutter/pages/login_page.dart';

class NavigatorUtil {
  /// 用于在获取不到 context 的地方，如 dao 中跳转页面使用，需要在 HomePage 赋值
  static BuildContext? _context;
  
  static updateContext(BuildContext context) {
    NavigatorUtil._context = context;
    print('init: $context');
  }

  /// 跳转到指定页面
  static push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  /// 跳转到首页，并且从登录页跳转到首页时，阻止用户的返回动作，比如侧滑返回等
  static goToHome(BuildContext context) {
    // 将首页变为栈顶
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  /// 跳转到登录页
  static goToLogin() {
    Navigator.pushReplacement(_context!, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}