// 创建元素之间包含间隔的列表

import 'package:flutter/material.dart';

class FlutterCNCreateSpaceList extends StatelessWidget {
  const FlutterCNCreateSpaceList({super.key});

  @override
  Widget build(BuildContext context) {
    const items = 40;

    return MaterialApp(
      title: 'Flutter Demo',
      // 去除 debug 模式下右上角的 DEBUG 标志
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        cardTheme: CardTheme(color: Colors.blue.shade50),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Space List'),
        ),
        // 使用 `LayoutBuilder` 动态获取布局约束
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            // 用 `ConstrainedBox` 限制子组件的最小高度
            child: ConstrainedBox(
              constraints: BoxConstraints(
                // 子组件最小高度等于布局的最大高度
                // 该例中，当列表项可以放满屏幕时，值为屏幕高度，
                // 当列表项超出屏幕时，值为所有列表项以及它们之间间距的总高度
                minHeight: constraints.maxHeight
              ),
              // 使用 `Column` 布局，创建竖直排列的列表
              child: Column(
                // 子组件之间均匀分布
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // 子组件横向拉伸以填充父组件
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // 动态生成每个列表项
                children: List.generate(items, (index) {
                  return FluttercnCreateSpaceListItemWidget(text: 'Item $index',);
                }),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class FluttercnCreateSpaceListItemWidget extends StatelessWidget {
  const FluttercnCreateSpaceListItemWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(text)),
      ),
    );
  }
}