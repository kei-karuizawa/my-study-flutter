import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:my_study_flutter/mksz741/util/screen_adapter_helper.dart';

class BannerWidget extends StatefulWidget {
  final List<String> bannerList;
  const BannerWidget({super.key, required this.bannerList});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final FlutterCarouselController _controller = FlutterCarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        FlutterCarousel(
            items: widget.bannerList.map((item) => _tabImage(item, width)).toList(),
            options: FlutterCarouselOptions(
              height: 160.px,
              autoPlay: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            )
        ),
        Positioned(
          bottom: 10,
            left: 0,
            right: 0,
            child: _indicator(),
        )
      ],
    );
  }

  Widget _tabImage(String imageURL, width) {
    // 手势包装器
    return GestureDetector(
      onTap: () {
        // todo
      },
      child: Image.network(imageURL, width: width, fit: BoxFit.cover),
    );
  }

  _indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.bannerList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () {
            _controller.animateToPage(entry.key);
          },
          child: Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(_current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}
