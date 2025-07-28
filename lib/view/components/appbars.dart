import 'package:flutter/material.dart';

import 'package:awakening_calc/view/components/texts.dart';
import 'buttons.dart';


class AppBars {

  static AppBar normalAppBar(BuildContext context){
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Texts.appSloganText(),
      actions: [
        Buttons.itemNavButton(context),
        Buttons.mapNavButton(context),
        // Texts.navigationText("Crafting Calculator"),
        // Texts.navigationText("Guild Shit"),
        // Texts.navigationText("Your Shit"),
      ],
    );
  }
}