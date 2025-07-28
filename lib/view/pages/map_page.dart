import 'package:flutter/material.dart';

import '../components/scaffolds.dart';
import '../components/texts.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  static const routeName = '/map_page';

  @override
  State<StatefulWidget> createState() {
    return _MapState();
  }
}

class _MapState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffolds.normalScaffold(
      context,
      Center(
        child: Texts.emptyPageText(
          "Ain't got no fuckin maps",
        ),
      ),
    );
  }
}
