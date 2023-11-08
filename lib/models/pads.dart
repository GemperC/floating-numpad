class Pad {
  double x;
  double y;
  int padNum;

  Pad({
    required this.x,
    required this.y,
    required this.padNum,
  });

  static List<Pad> padList = [
    Pad(x: 130, y: 370, padNum: 9),
    Pad(x: 360, y: 370, padNum: 8),
    Pad(x: 590, y: 370, padNum: 7),
    Pad(x: 130, y: 600, padNum: 6),
    Pad(x: 360, y: 600, padNum: 5),
    Pad(x: 590, y: 600, padNum: 4),
    Pad(x: 130, y: 820, padNum: 3),
    Pad(x: 360, y: 820, padNum: 2),
    Pad(x: 590, y: 820, padNum: 1),
  ];

  static double padMargin = 90;
}

// 9
  // double xL = 220;
  // double xR = 40;
  // double yT = 280;
  // double yB = 460;

  // double boxLength = 180
  // double disBoxes = 230

// 9
  // double x = 130;
  // double y = 370;

// 8
  // double x = 360;
  // double y = 370;

// 7
  // double x = 590;
  // double y = 370;

// 6
  // double x = 130;
  // double y = 600;

// 5
  // double x = 360;
  // double y = 600;

// 4
  // double x = 590;
  // double y = 600;

// 3
  // double x = 130;
  // double y = 820;

// 2
  // double x = 360;
  // double y = 820;

// 1
  // double x = 590;
  // double y = 820;

