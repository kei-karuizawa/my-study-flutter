import 'package:flutter/material.dart';
import 'package:my_study_flutter/mksz741/dao/login_dao.dart';
import 'package:my_study_flutter/mksz741/util/navigator_util.dart';
import 'package:my_study_flutter/mksz741/widgets/banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// AutomaticKeepAliveClientMixin 目的是
// 由于 tab_navigator 默认情况下，导航到其他页面时，前一个页面会被销毁
// 加上这个的话可以让页面在内存中常驻
// 需要实现 `wantKeepAlive`
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final bannerList = ["", "", "", ""];
  double appBarAlpha = 0;

  get _logoutBtn => TextButton(
      onPressed: () {
        LoginDao.logout();
      },
      child: const Text(
        '登出',
        style: TextStyle(color: Colors.white),
      ));

  get _appBar => Opacity(
        opacity: appBarAlpha,
        child: Container(
          height: 100,
          decoration: const BoxDecoration(color: Colors.white),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text("首页", style: TextStyle(color: Colors.black),),
            ),
          ),
        ),
      );

  get _listView => ListView(
    children: [
      BannerWidget(bannerList: bannerList),
      _logoutBtn,
      const SizedBox(height: 800, child: ListTile(title: Text("哈哈")),),
    ],
  );

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('首页', style: TextStyle(color: Colors.white),),
      //   backgroundColor: Colors.blue,
      //   actions: [
      //   _logoutBtn,
      // ],),
      body: Stack(
        children: [
          // 移除顶部为了安全区域留出的距离
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                  return false;
                },
                child: _listView,
              )
          ),
          _appBar,
        ],
      ),
      // body: Column(
      //   children: [
      //     BannerWidget(bannerList: bannerList,)
      //   ],
      // ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void _onScroll(double offset) {
    double alpha = offset / 100;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }
}
