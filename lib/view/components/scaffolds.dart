import 'package:flutter/material.dart';
import 'appbars.dart';

class Scaffolds {
  static Widget normalScaffold(BuildContext context, Widget child) {
    return Scaffold(
      appBar: AppBars.normalAppBar(context),
      body: Container(
        color: Colors.black54,
        child: child,
      ),
    );
  }
}