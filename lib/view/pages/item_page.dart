import 'package:flutter/material.dart';

import '../components/content_frames.dart';
import '../components/scaffolds.dart';
import '../components/texts.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});
  static const routeName = '/item_page';

  @override
  State<StatefulWidget> createState() {
    return _ItemPageState();
  }
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffolds.normalScaffold(
        context,
        Column(
          children: [
            Texts.contentFrameHeaderText(
              "This is the goddamned Item Page",
            ),
            ContentFrames.itemContentFrame(),
          ],
        ),
      ),
    );
  }
}
