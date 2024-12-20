import 'package:flutter/material.dart';
import 'package:my_study_flutter/fluttercn/interface/layout/layout_guide/fluttercn_layout_guide_button_with_text.dart';

class FlutterCNButtonSection extends StatelessWidget {
  const FlutterCNButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           FlutterCNButtonWithText(
             color: color,
             icon: Icons.call,
             label: 'CALL',
           ),
          FlutterCNButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          FlutterCNButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}