import 'package:awakening_calc/model/category.dart';
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

    Category? _selectedMainCategory = itemTracker.getSelectedCategory();
    Category? _selectedSubCategory = itemTracker.getSelectedSubCategory();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            const Text("Select a category"),
            Spacers.innerFieldSpacer(),
            DropdownMenu<Category>(
              initialSelection: _selectedMainCategory,
              onSelected: (Category? category) {
                itemTracker.updateSelectedCategory(category);
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
                onSelected: (String? subcategory) {
                  itemTracker.updateSelectedSubCategory(subcategory);
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
