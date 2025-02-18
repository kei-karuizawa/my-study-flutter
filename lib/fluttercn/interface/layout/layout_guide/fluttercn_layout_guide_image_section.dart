import 'package:flutter/material.dart';

class FlutterCNImageSection extends StatelessWidget {
  const FlutterCNImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}