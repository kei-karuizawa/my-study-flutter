// 构建一个横向列表

import 'package:flutter/material.dart';

class FlutterCNCreateHorizontalList extends StatelessWidget {
  const FlutterCNCreateHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Horizontal List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Container(
          // 垂直方向上下都设置 20 间距
          margin: const EdgeInsets.symmetric(vertical: 20),
          // 不加高度的话，默认撑满整个屏幕高度
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            // 这个创建了几个色块（横向），
            // 实际运行后发现 `ListView` 会自动将内部宽度设置为这些色块的总宽度
            children: [
              Container(
                width: 160,
                color: Colors.red,
              ),
              Container(
                width: 160,
                color: Colors.blue,
              ),
              Container(
                width: 160,
                color: Colors.green,
              ),
              Container(
                width: 160,
                color: Colors.yellow,
              ),
              Container(
                width: 160,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}