import 'package:flutter/material.dart';
import 'package:my_study_flutter/mksz741/pages/home_page.dart';
import 'package:my_study_flutter/mksz741/pages/my_page.dart';
import 'package:my_study_flutter/mksz741/pages/search_page.dart';
import 'package:my_study_flutter/mksz741/pages/travel_page.dart';

import '../util/navigator_util.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    NavigatorUtil.updateContext(context);
    return Scaffold(
      body: PageView(
        controller: _controller,
        // 禁用左右滚动
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,  // 设置默认文本颜色，有些 Flutter 版本图标下面文字的颜色不会和图标颜色一致
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem('首页', Icons.home, 0),
          _bottomItem('搜索', Icons.search, 1),
          _bottomItem('旅拍', Icons.camera_alt, 2),
          _bottomItem('我的', Icons.account_circle, 3),
        ],
      ),
    );
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: _defaultColor,),
        activeIcon: Icon(icon, color: _activeColor,),
        label: title
    );
  }
}
