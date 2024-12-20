import 'package:flutter/material.dart';
import 'package:my_study_flutter/mksz741/dao/login_dao.dart';
import 'package:my_study_flutter/mksz741/util/navigator_util.dart';
import 'package:my_study_flutter/mksz741/util/string_util.dart';
import 'package:my_study_flutter/mksz741/util/view_util.dart';
import 'package:my_study_flutter/mksz741/widgets/input_widget.dart';
import 'package:my_study_flutter/mksz741/widgets/login_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginEnable = false;
  String? userName;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ..._background(),
          _content(context),
        ],
      ),
    );
  }

  _background() {
    return [
      // 这样设置，图片不会填充满屏幕，因为没有设置图片的宽高
      // Image.asset('images/trip_flutter/login-bg1.jpg', fit: BoxFit.cover,),

      // 要这样：
      // `Positioned` 这个组件可以设置左、右、上、下，如果是默认 0 则代表距离屏幕边距是 0，默认填充屏幕
      // 如果它有父视图，那么会默认充满父视图
      Positioned.fill(
          child: Image.asset(
        'images/trip_flutter/login-bg1.jpg',
        fit: BoxFit.cover,
      )),

      // 要给图片添加一个蒙版
      Positioned.fill(
          child: Container(
        decoration: const BoxDecoration(color: Colors.black54),
      ))
    ];
  }

  _content(context) {
    return Positioned.fill(
      left: 25, right: 25,

      // 为什么这里需要 ListView 呢？为了有些小屏手机，可能登录页面整个内容放不下，所以设置可滑动
      child: ListView(
        children: [
          hiSpace(height: 100),
          const Text(
            '账号密码登录',
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
          hiSpace(height: 40),
          InputWidget(
            '请输入账号',
            onChanged: (text) {
              userName = text;
              _checkInput();
            },
            obscureText: false,
          ),
          hiSpace(height: 10),
          InputWidget('请输入密码', obscureText: true, onChanged: (text) {
            password = text;
            _checkInput();
          },),
          hiSpace(height: 45),
          LoginButton(
            '登录',
            enable: loginEnable,
            onPressed: () => _login(context),
          ),
          hiSpace(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(  // 这个 `InkWell` 组件可以给一个 Widget 增加点击事件，它里面有非常多点击事件，点击、长按等
              onTap: () => _jumpToRegistration(),
              child: const Text(
                '注册账号',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _checkInput() {
    bool enable;
    if (isNotEmpty(userName) && isNotEmpty(password)) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  _login(context) async {
    try {
      // var result = LoginDao.login(userName: userName!, password: password!);
      // print('登录成功');
      NavigatorUtil.goToHome(context);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  _jumpToRegistration() async {
    // Uri uri = Uri.parse('https://api.devio.org/uapi/swagger-ui.html#/Account/registrationUsingPOST');
    // if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    //   throw 'Could not open URL';
    // }
  }
}
