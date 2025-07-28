import 'package:flutter/material.dart';

class Spacers {
  static const double _innerFieldWidth = 20,
      _outerFieldWidth = 100,
      _fieldHeight = 20;

  static SizedBox innerFieldSpacer() {
    return const SizedBox(
      width: _innerFieldWidth,
      height: _fieldHeight,
    );
  }

  static SizedBox outerFieldSpacer() {
    return const SizedBox(
      width: _outerFieldWidth,
      height: _fieldHeight,
    );
  }
}
