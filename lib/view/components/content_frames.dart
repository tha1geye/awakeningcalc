import 'package:awakening_calc/view/components/panels.dart';
import 'package:awakening_calc/view/components/spacers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_data/constants.dart';
import '../../controller/simple_state_controller.dart';
import '../../model/item_tree.dart';

class ContentFrames {
  static Column itemContentFrame(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            categorySelectionContentFrame(context),
          ],
        ),
        // the next panel will be dynamic based on the category and sub-cat selected above
      ],
    );
  }

  static Widget categorySelectionContentFrame(BuildContext context) {
    var itemTracker = context.read<ItemTracker>();
    String? _selectedMainCategory = itemTracker.getSelectedCategory();
    String? _selectedSubCategory = itemTracker.getSelectedSubCategory();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            const Text("Select a category"),
            Spacers.innerFieldSpacer(),
            DropdownMenu<String>(
              initialSelection: _selectedMainCategory,
              onSelected: (String? value) {
                itemTracker.updateSelectedCategory(value);
              },
              dropdownMenuEntries: itemTracker.getCategoryMenuEntries(),
            ),
          ],
        ),
        Spacers.outerFieldSpacer(),
        Row(
          children: [
            const Text("Select a Subcategory"),
            Spacers.innerFieldSpacer(),
            Consumer<ItemTracker>(
              builder: (context, tracker, child) => DropdownMenu<String>(
                initialSelection: _selectedSubCategory,
                onSelected: (String? value) {
                  itemTracker.updateSelectedSubCategory(value);
                },
                dropdownMenuEntries: itemTracker.getSubCategoryMenuEntries(),
              ),
            )
          ],
        ),
      ],
    );
  }
}
