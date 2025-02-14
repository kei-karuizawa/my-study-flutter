// 为你的应用添加交互

import 'package:flutter/material.dart';

class FluttercnInterActionFavoriteWidget extends StatefulWidget {
  const FluttercnInterActionFavoriteWidget({super.key});

  @override
  State<FluttercnInterActionFavoriteWidget> createState() => _FluttercnInterActionFavoriteWidget();
}

class _FluttercnInterActionFavoriteWidget extends State<FluttercnInterActionFavoriteWidget> {
  // 当应用第一次启动时，用户界面显示一个红色实心的星星形图标
  bool _isFavorited = true;

  // 并且有 41 个「喜欢」
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            // 在 Flutter 中，IconButton 的默认大小比 icon 略大，通常是 48x48 像素，
            // 而 icon 的大小是 24x24 像素。这是为了提供更大的触摸区域，提高用户体验
            // 要去除默认的间距，最简单的办法是将上面的 `Container` 换成 `SizeBox`，
            // 并将 `SizeBox` 的宽高都设置为 24
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 20,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}