// 构建一个网格视图

import 'package:flutter/material.dart';

class FlutterCNCreateGrid extends StatelessWidget {
  const FlutterCNCreateGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.count(
          // 每行 2 个
          crossAxisCount: 2,
          // 用这种方式一次性创建 100 个元素
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }),
        ),
      ),
    );
  }
}
