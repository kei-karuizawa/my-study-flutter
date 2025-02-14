// 处理长列表

import 'package:flutter/material.dart';

class FlutterCNHandlerLongList extends StatelessWidget {
  const FlutterCNHandlerLongList({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';
    List<String> items = List<String>.generate(10000, (i) => 'Item $i');

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          // 设置列表项的总数量为 `items` 的长度
          itemCount: items.length,
          // 提供一个 `prototypeItem`，用于定义列表项的默认布局（优化渲染性能）
          // 在渲染列表项之前，`ListView.builder` 通过 `prototypeItem` 来计算每个项的高度，从而更高效地滚动列表
          prototypeItem: ListTile(
            title: Text(items.first),
          ),
          // `itemBuilder` 是一个回调函数，动态构建列表项
          // `itemBuilder` 按需生成列表项，适合处理大量数据
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}