// 构建包含不同类型元素的列表

import 'package:flutter/material.dart';

class FlutterCNCreateGroupList extends StatelessWidget {
  final List<FlutterCNCreateGroupListItem> items;

  const FlutterCNCreateGroupList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Mixed List';
    
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        // 另一种创建列表项的方法
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubTitle(context),
            );
          },
        ),
      ),
    );
  }
}

// 一个抽象类，相当于接口
// 用于定义每个列表项的主标题和副标题
abstract class FlutterCNCreateGroupListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubTitle(BuildContext context);
}

// 创建列表分组头部视图
class FlutterCNCreateGroupHeadingItem implements FlutterCNCreateGroupListItem {
  final String heading;

  FlutterCNCreateGroupHeadingItem(this.heading);

  // 头部视图只需一行即可
  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  // 由于头部视图仅需一行文字，所以副标题留空
  // 这里创建一个空白的视图留空，`SizedBox.shrink` 宽高实际上为 0
  @override
  Widget buildSubTitle(BuildContext context) {
    return const SizedBox.shrink();
  }
}

// 创建列表项，分为主标题和副标题
class FlutterCNCreateGroupMessageItem implements FlutterCNCreateGroupListItem {
  final String sender;
  final String body;

  FlutterCNCreateGroupMessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(sender);
  }

  @override
  Widget buildSubTitle(BuildContext context) {
    return Text(body);
  }
}