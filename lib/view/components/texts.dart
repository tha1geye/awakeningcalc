import 'package:flutter/material.dart';

import 'package:awakening_calc/view/components/textstyles.dart';

class Texts {
  static const double _navTextWidth = 100,
      _navTextHeight = 20,
      _fieldTextWidth = 50,
      _fieldTextHeight = 20;

  static Widget appSloganText() {
    return Text(
      "The seeper has abaconed",
      style: TextStyles.sloganTextStyle(),
    );
  }

  static Widget contentFrameHeaderText(String text) {
    return Text(
      text,
      style: TextStyles.contentFrameHeaderTextStyle(),
    );
  }

  static Widget navigationText(String text) {
    return Text(
      text,
      style: TextStyles.navigationTextStyle(),
    );
  }

  static Text fieldText(String text) {
    return Text(
      text,
    );
  }

  static Text emptyPageText(String text) {
    return Text(
      text,
      style: TextStyles.emptyPageTextStyle(),
    );
  }
}
