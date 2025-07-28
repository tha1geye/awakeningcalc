import 'package:flutter/material.dart';

import 'package:awakening_calc/view/components/spacers.dart';
import 'package:awakening_calc/view/components/texts.dart';

class Panels {

  static Row addItemTopPanel(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Texts.fieldText("Title"),
        Spacers.innerFieldSpacer(),
        Texts.fieldText("Placeholder Title"),
        Spacers.outerFieldSpacer(),
        Texts.fieldText("Category"),
        Spacers.innerFieldSpacer(),
        Texts.fieldText("Category Selection Placeholder"),
        Spacers.outerFieldSpacer(),
        Texts.fieldText("Sub-Category"),
        Spacers.innerFieldSpacer(),
        Texts.fieldText("Sub-Category Selection Placeholder"),
        Spacers.outerFieldSpacer(),
      ],
    );
  }
}