
import 'package:flutter/material.dart';

class TextStyles {
  static const _navigationFontSize = 16.0;
  static const _navigationFontWeight = FontWeight.bold;
  static const _emptyPageFontSize = 48.0;
  static const _contentFrameHeaderFontSize = 18.0;

  static TextStyle? navigationTextStyle() {
    return const TextStyle(
      fontSize: _navigationFontSize,
      fontWeight: _navigationFontWeight,
      color: Colors.black45,
    );
  }

  static TextStyle? sloganTextStyle() {
    return const TextStyle(
      fontSize: _navigationFontSize,
      fontWeight: _navigationFontWeight,
      color: Colors.black45,
    );
  }

  static TextStyle? contentFrameHeaderTextStyle(){
    return const TextStyle(fontSize: _contentFrameHeaderFontSize);
  }

  static TextStyle? emptyPageTextStyle() {
    return const TextStyle(
      fontSize: _emptyPageFontSize,
      fontWeight: _navigationFontWeight,
      color: Colors.black45,
    );
  }

}
