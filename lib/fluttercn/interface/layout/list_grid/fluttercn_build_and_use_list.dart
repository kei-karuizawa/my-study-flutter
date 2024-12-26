// 构建与使用列表

import 'package:flutter/material.dart';

class FlutterCNBuildAndUseList extends StatelessWidget {
  const FlutterCNBuildAndUseList({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView(
          children: const [
            // `ListTile` 可以方便的创建列表项，可以有标题，左样式、右样式等，
            // 也可以自定义颜色、还可以添加一些手势等
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ),
      ),
    );
  }
}