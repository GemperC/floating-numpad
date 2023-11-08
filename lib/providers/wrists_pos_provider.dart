import 'package:floating_numpad/models/pads.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

import '../pages/numpad/pose_detection/painters/pose_painter.dart';

class WristsPositionProvider extends ChangeNotifier {
  double leftWrist_X_Current_Pos = 0;
  double leftWrist_Y_Current_Pos = 0;
  double rightWrist_X_Current_Pos = 0;
  double rightWrist_Y_Current_Pos = 0;
  double showNumpadMinimunHeight = 210;

  bool numpadActive = false;
  bool handsClapped = false;
  double clappedHandsBoxSize = 100;
  List<Pad> padslist = Pad.padList;
  int selectedPadNum = 0;

  void checkWristsPos(PosePainter painter) {
    leftWrist_X_Current_Pos =
        painter.poses.first.landmarks[PoseLandmarkType.leftWrist]!.x;
    leftWrist_Y_Current_Pos =
        painter.poses.first.landmarks[PoseLandmarkType.leftWrist]!.y;

    // Right Wrist Coordinates
    rightWrist_X_Current_Pos =
        painter.poses.first.landmarks[PoseLandmarkType.rightWrist]!.x;
    rightWrist_Y_Current_Pos =
        painter.poses.first.landmarks[PoseLandmarkType.rightWrist]!.y;
    if (numpadActive) {
      if (!isHandsClapped(painter)) {
        numpadActive = false;
      } else {}
    } else {
      numpadActive = shouldShowNumpad(painter);
    }

    notifyListeners();
  }

  void checkSelecedPads(PosePainter painter) {
    padslist.forEach((pad) {
      selectedPadNum = isPadSelected(painter, pad);
      print(selectedPadNum);
    });
  }

  int isPadSelected(PosePainter painter, Pad pad) {
    if (leftWrist_X_Current_Pos > pad.x - Pad.padMargin &&
        leftWrist_X_Current_Pos < pad.x + Pad.padMargin &&
        leftWrist_Y_Current_Pos > pad.y - Pad.padMargin &&
        leftWrist_Y_Current_Pos < pad.y + Pad.padMargin) {
      return pad.padNum;
    }
    return 0;
  }

  bool shouldShowNumpad(PosePainter painter) {
    bool handsInActicatorLine = isHandsInActicatorLine(painter);
    bool handsClapped = isHandsClapped(painter);

    if (handsInActicatorLine && handsClapped) {
      return true;
    } else {
      return false;
    }
  }

  bool isHandsInActicatorLine(PosePainter painter) {
    if (leftWrist_Y_Current_Pos < showNumpadMinimunHeight &&
        rightWrist_Y_Current_Pos < showNumpadMinimunHeight)
      return true;
    else
      return false;
  }

  bool isHandsClapped(PosePainter painter) {
    if (rightWrist_Y_Current_Pos - leftWrist_Y_Current_Pos < clappedHandsBoxSize &&
        rightWrist_Y_Current_Pos - leftWrist_Y_Current_Pos >
            -clappedHandsBoxSize &&
        rightWrist_X_Current_Pos - leftWrist_X_Current_Pos <
            clappedHandsBoxSize &&
        rightWrist_X_Current_Pos - leftWrist_X_Current_Pos >
            -clappedHandsBoxSize) return true;

    return false;
  }

  void printCords(PosePainter painter) {
    // Left Wrist Coordinates
    print(
        "leftWrist X = ${painter.poses.first.landmarks[PoseLandmarkType.leftWrist]!.x}");
    print(
        "leftWrist Y = ${painter.poses.first.landmarks[PoseLandmarkType.leftWrist]!.y}");

    // Right Wrist Coordinates
    print(
        "rightWrist X = ${painter.poses.first.landmarks[PoseLandmarkType.rightWrist]!.x}");
    print(
        "rightWrist Y = ${painter.poses.first.landmarks[PoseLandmarkType.rightWrist]!.y}");
  }
}



    // int errorMargin = 100;
    // int leftWrist_X_Pos = 550;
    // int leftWrist_Y_Pos = 590;
    // int rightWrist_X_Pos = 173;
    // int rightWrist_Y_Pos = 602;

    // // Check left wrist
    // if (landmarks[PoseLandmarkType.leftWrist]!.x <
    //         leftWrist_X_Pos - errorMargin ||
    //     landmarks[PoseLandmarkType.leftWrist]!.x >
    //         leftWrist_X_Pos + errorMargin ||
    //     landmarks[PoseLandmarkType.leftWrist]!.y <
    //         leftWrist_Y_Pos - errorMargin ||
    //     landmarks[PoseLandmarkType.leftWrist]!.y >
    //         leftWrist_Y_Pos + errorMargin) {
    //   return false;
    // }

    // // Check right wrist
    // if (landmarks[PoseLandmarkType.rightWrist]!.x <
    //         rightWrist_X_Pos - errorMargin ||
    //     landmarks[PoseLandmarkType.rightWrist]!.x >
    //         rightWrist_X_Pos + errorMargin ||
    //     landmarks[PoseLandmarkType.rightWrist]!.y <
    //         rightWrist_Y_Pos - errorMargin ||
    //     landmarks[PoseLandmarkType.rightWrist]!.y >
    //         rightWrist_Y_Pos + errorMargin) {
    //   return false;
    // }

    // All checks passed