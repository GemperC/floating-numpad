import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

import 'coordinates_translator.dart';

class PosePainter extends CustomPainter {
  PosePainter(this.poses, this.absoluteImageSize, this.rotation);

  final List<Pose> poses;
  final Size absoluteImageSize;
  final InputImageRotation rotation;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Color.fromARGB(158, 255, 0, 0);

    // final leftPaint = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 3.0
    //   ..color = Colors.yellow;

    // final rightPaint = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 3.0
    //   ..color = Colors.blueAccent;

    for (final pose in poses) {
      // painterDebug(canvas, paint, size);

      PoseLandmark? leftWrist = pose.landmarks[PoseLandmarkType.leftWrist];
      if (leftWrist != null) {
        canvas.drawCircle(
            Offset(
              translateX(leftWrist.x, rotation, size, absoluteImageSize),
              translateY(leftWrist.y, rotation, size, absoluteImageSize),
            ),
            20,
            paint);
      }

      PoseLandmark? rightWrist = pose.landmarks[PoseLandmarkType.rightWrist];
      if (rightWrist != null) {
        canvas.drawCircle(
            Offset(
              translateX(rightWrist.x, rotation, size, absoluteImageSize),
              translateY(rightWrist.y, rotation, size, absoluteImageSize),
            ),
            20,
            paint);
      }
    }
  }

  void painterDebug(Canvas canvas, Paint paint, Size size) {
    double x = 590;
    double y = 820;

    canvas.drawCircle(
        Offset(
          translateX(x, rotation, size, absoluteImageSize),
          translateY(y, rotation, size, absoluteImageSize),
        ),
        3,
        paint);
  }

  @override
  bool shouldRepaint(covariant PosePainter oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.poses != poses;
  }
}


  //   for (final pose in poses) {
  //     if (debug) {
  //       pose.landmarks.forEach((_, landmark) {
  //         canvas.drawCircle(
  //             Offset(
  //               translateX(landmark.x, rotation, size, absoluteImageSize),
  //               translateY(landmark.y, rotation, size, absoluteImageSize),
  //             ),
  //             30,
  //             paint);
  //       });
  //       // pose.landmarks.forEach((_, landmark) {
  //       //   canvas.drawCircle(
  //       //       Offset(
  //       //         translateX(landmark.x, rotation, size, absoluteImageSize),
  //       //         translateY(landmark.y, rotation, size, absoluteImageSize),
  //       //       ),
  //       //       30,
  //       //       paint);
  //       // });

  //       // void paintLine(
  //       //     PoseLandmarkType type1, PoseLandmarkType type2, Paint paintType) {
  //       //   final PoseLandmark joint1 = pose.landmarks[type1]!;
  //       //   final PoseLandmark joint2 = pose.landmarks[type2]!;
  //       //   canvas.drawLine(
  //       //       Offset(translateX(joint1.x, rotation, size, absoluteImageSize),
  //       //           translateY(joint1.y, rotation, size, absoluteImageSize)),
  //       //       Offset(translateX(joint2.x, rotation, size, absoluteImageSize),
  //       //           translateY(joint2.y, rotation, size, absoluteImageSize)),
  //       //       paintType);
  //       // }

  //       // //Draw arms
  //       // paintLine(PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow,
  //       //     leftPaint);
  //       // paintLine(
  //       //     PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist, leftPaint);
  //       // paintLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightElbow,
  //       //     rightPaint);
  //       // paintLine(PoseLandmarkType.rightElbow, PoseLandmarkType.rightWrist,
  //       //     rightPaint);

  //       // //Draw Body
  //       // paintLine(
  //       //     PoseLandmarkType.leftShoulder, PoseLandmarkType.leftHip, leftPaint);
  //       // paintLine(PoseLandmarkType.rightShoulder, PoseLandmarkType.rightHip,
  //       //     rightPaint);

  //       // //Draw legs
  //       // paintLine(
  //       //     PoseLandmarkType.leftHip, PoseLandmarkType.leftKnee, leftPaint);
  //       // paintLine(
  //       //     PoseLandmarkType.leftKnee, PoseLandmarkType.leftAnkle, leftPaint);
  //       // paintLine(
  //       //     PoseLandmarkType.rightHip, PoseLandmarkType.rightKnee, rightPaint);
  //       // paintLine(PoseLandmarkType.rightKnee, PoseLandmarkType.rightAnkle,
  //       //     rightPaint);
  //     }

  //     // print(pose.landmarks[PoseLandmarkType.leftWrist]!.x);
  //   }
  // }
