import 'package:flutter/material.dart';
import '../../app_data/constants.dart';
import 'appbars.dart';

class Scaffolds {
  static Widget normalScaffold(BuildContext context, Widget child) {
    return Scaffold(
      appBar: AppBars.normalAppBar(context),
      body: Container(
        color: COLORS['windowBackground'],
        child: child,
      ),
    );
  }
}