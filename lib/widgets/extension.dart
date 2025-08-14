import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumberExtension on num {
  SizedBox toColumnSpace() => SizedBox(height: toDouble().h);
  SizedBox toRowSpace() => SizedBox(width: toDouble().w);
  double toFontSize() => sp;
  String toOrdinal() {
    if (this % 100 == 11 || this % 100 == 12 || this % 100 == 13) {
      return '${this}th';
    }

    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }
}
