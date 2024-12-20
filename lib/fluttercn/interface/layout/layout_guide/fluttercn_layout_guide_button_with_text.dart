import 'package:flutter/material.dart';

class FlutterCNButtonWithText extends StatelessWidget {
  const FlutterCNButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      // 按钮 + 文字总体上是竖向布局，
      // 设置 `Column` 的主轴大小为最小，以便在显示时不占用多余空间
      mainAxisSize: MainAxisSize.min,
      // 设置 `Column` 内部组件在主轴上的对齐方式为居中
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color,),
        // 设置 `Padding`，为文本提供上边距，距离图标 8 像素
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
             style: TextStyle(
               fontSize: 12,
               fontWeight: FontWeight.w400,
               color: color,
             ),
          ),
        )
      ],
    );
  }
}