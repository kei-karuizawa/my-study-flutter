import 'package:flutter/material.dart';
import 'package:my_study_flutter/fluttercn/interface/layout/layout_guide/fluttercn_layout_guide_button_section.dart';
import 'package:my_study_flutter/fluttercn/interface/layout/layout_guide/fluttercn_layout_guide_image_section.dart';
import 'package:my_study_flutter/fluttercn/interface/layout/layout_guide/fluttercn_layout_guide_text_section.dart';
import 'package:my_study_flutter/fluttercn/interface/layout/layout_guide/fluttercn_layout_guide_title_section.dart';

class FlutterCNLayoutGuideDemo extends StatelessWidget {
  const FlutterCNLayoutGuideDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';

    // 直接返回一个 App
    return MaterialApp(
      // 这个 app 的标题，需要注意的是，这里并没有创建实际的 UI
      // 这个 `title` 参数的作用不是代表页面的标题，而是代表页面的一个标识，
      // 在安卓端，它代表的是多任务状态下的标题；
      // 在 iOS 端，该值无效；
      // 在 web 端是 tab 页面的名称；
      title: appTitle,
      // `Scaffold` 是一个页面的容器，它包含了页面的基本结构，
      // 比如顶部栏、底部栏、主体内容区域等
      home: Scaffold(
        // `Scaffold` 提供的顶部栏
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        // `Scaffold` 提供的主体区域
        body: const SingleChildScrollView(
          child: Column(
            children: [
              FlutterCNImageSection(
                image: 'lib/fluttercn/interface/layout/layout_guide/lake.jpg',
              ),
              FlutterCNTitleSection(
                name: 'Oeschinen Lake Campground',
                location: 'Kandersteg, Switzerland',
              ),
              FlutterCNButtonSection(),
              FlutterCNTextSection(
                description:
                    'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                    'Bernese Alps. Situated 1,578 meters above sea level, it '
                    'is one of the larger Alpine Lakes. A gondola ride from '
                    'Kandersteg, followed by a half-hour walk through pastures '
                    'and pine forest, leads you to the lake, which warms to 20 '
                    'degrees Celsius in the summer. Activities enjoyed here '
                    'include rowing, and riding the summer toboggan run.',
              ),
            ],
          ),
        )
      ),
    );
  }
}
