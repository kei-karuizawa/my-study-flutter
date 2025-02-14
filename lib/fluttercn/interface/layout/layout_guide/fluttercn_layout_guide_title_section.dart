import 'package:flutter/material.dart';
import 'package:my_study_flutter/fluttercn/interface/user_interaction/fluttercn_demo_add_interaction.dart';

class FlutterCNTitleSection extends StatelessWidget {
  const FlutterCNTitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    // 最外层的大框
    return Padding(
      padding: const EdgeInsets.all(32),
      // 大框内分成三个部分，呈横向布局
      // 大框内分三个部分，竖向排列的两行文字、星号、数字
      child: Row(
        children: [
          // `Expanded` 占满行内空间
          Expanded(
            // 这个 `Column` 就是为了实现第一部分 - 竖向排列的两行文本
            child: Column(
              // 将列放在行的开头
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 这个 `Padding` 的左右是让两行文字之间有一个距离，
                // 所以让第一行的文字包裹在一个 `Padding` 组件里，
                // 而第二行的文字就不必用 `Padding` 包裹了
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),

          // 去掉原来的图标和文字，我们要换成自己后面封装的
          // Icon(
          //   Icons.star,
          //   color: Colors.red[500],
          // ),
          // const Text('41'),

          // 替换自己封装的组件
          const FluttercnInterActionFavoriteWidget(),
        ],
      ),
    );
  }
}
