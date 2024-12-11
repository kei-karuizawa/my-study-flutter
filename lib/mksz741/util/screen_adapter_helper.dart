import 'package:flutter/cupertino.dart';

// 通过拓展来减少适配的成本
// 因为尺寸要么整数要么浮点数
// 针对这两个适配即可
// 使用时，比如设计稿上的组件是 200 * 200，
// 那么我们就这样：200.px * 200.px

extension IntFix on int {
  double get px {
    return ScreenHelper.getPx(toDouble());
  }
}

extension DoubleFix on double {
  double get px {
    return ScreenHelper.getPx(this);
  }
}

// 屏幕适配的工具类
class ScreenHelper {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double radio;

  // 根据设计稿的实际宽度初始化
  // 由于屏幕大小和上下文有关，所以需要传递上下文
  // baseWidth 就是设计稿宽度，这个根据实际项目而定，一般 UI 提供的设计稿是多宽就多宽
  static init(BuildContext context, {double baseWidth=375}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    // 以设计稿宽度为基准，来获取屏幕实际宽度相对于设计稿的宽度的缩放比 ratio
    radio = screenWidth / baseWidth;
  }

  // 获取开发中的尺寸大小相对于设计稿宽度的实际大小
  // 获取设计稿上的组件在不同设备上的实际大小
  // 比如设计稿上的某个组件大小是 200 * 200，
  // 那么通过这个方法就可以得到这个组件在不同设备上的实际大小
  static double getPx(double size) {
    return ScreenHelper.radio * size;
  }
}