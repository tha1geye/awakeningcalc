import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/simple_state_controller.dart';
import '../components/content_frames.dart';
import '../components/scaffolds.dart';
import '../components/spacers.dart';
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
    var itemTracker = context.read<ItemTracker>();

    return PopScope(
      child: Scaffolds.normalScaffold(
        context,
        Column(
          children: [
            Texts.contentFrameHeaderText(
              "This is the goddamned Item Page",
            ),
            ContentFrames.itemContentFrame(context),
            Consumer<ItemTracker>(
              builder: (context, tracker, child) => Row(
                children: [
                  const Text("Selected Category"),
                  Spacers.innerFieldSpacer(),
                  Text(
                    tracker.getSelectedCategory(),
                  ),
                  Spacers.outerFieldSpacer(),
                  const Text("Selected SubCategory"),
                  Spacers.innerFieldSpacer(),
                  Text(
                    tracker.getSelectedSubCategory(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
