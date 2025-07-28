import 'package:flutter/material.dart';

import '../components/scaffolds.dart';
import '../components/texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/home_page';

  @override
  State<StatefulWidget> createState() {
    return _UserHomeState();
  }
}

class _UserHomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffolds.normalScaffold(context, Center(
            child: Texts.emptyPageText("I'll give you a goddamned home page"),
          ),
        ),
    );
  }
}
