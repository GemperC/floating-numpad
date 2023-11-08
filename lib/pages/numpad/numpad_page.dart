import 'package:flutter/material.dart';

import 'numpad_widget.dart';
import 'pose_detection/pose_detector_view.dart';

class NumpadPage extends StatelessWidget {
  const NumpadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          PoseDetectorView(paintPose: true),
          NumpadWidget(),
        ],
      ),
    );
  }
}
