import 'package:awakening_calc/view/pages/item_page.dart';
import 'package:awakening_calc/view/components/texts.dart';
import 'package:flutter/material.dart';

import '../pages/map_page.dart';

class Buttons {
  static TextButton itemNavButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).push(

        MaterialPageRoute(
          builder: (context) => const ItemPage(),
        ),
      ),
      child: Texts.navigationText("Items"),
    );
  }

  static TextButton mapNavButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MapPage(),
        ),
      ),
      child: Texts.navigationText("Map"),
    );
  }
}
