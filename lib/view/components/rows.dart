import 'package:flutter/material.dart';

import 'package:awakening_calc/view/components/texts.dart';


class Rows {
  static Row navigationRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Texts.navigationText("Items"),
        Texts.navigationText("Craftin"),
        Texts.navigationText("Guildin"),
        Texts.navigationText("Them Hills"),
        Texts.navigationText("User"),
      ],
    );
  }
}
