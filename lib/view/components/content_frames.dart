import 'package:awakening_calc/model/category.dart';
import 'package:awakening_calc/view/components/panels.dart';
import 'package:awakening_calc/view/components/rows.dart';
import 'package:awakening_calc/view/components/spacers.dart';
import 'package:awakening_calc/view/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_data/constants.dart';
import '../../controller/item_tracker.dart';
import '../../controller/simple_state_controller.dart';
import '../../model/item_tree.dart';

class ContentFrames {
  static Widget itemContentFrame(BuildContext context) {
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

    String? _selectedCategoryId = itemTracker.getSelectedCategoryId();
    String? _selectedSubcategoryId = itemTracker.getSelectedSubcategoryId();

    return Consumer<ItemTracker>(builder: (context, tracker, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Rows.dropdownMenuRow(
            title: "Select a category",
            child: DropdownMenu<String>(
              initialSelection: tracker.getSelectedCategoryId(),
              onSelected: (String? categoryId) {
                itemTracker.updateSelectedCategoryById(categoryId);
              },
              dropdownMenuEntries: itemTracker.getCategoryMenuEntries(),
            ),
          ),
          Spacers.outerFieldSpacer(),
          Rows.dropdownMenuRow(
            title: "Select a Subcategory",
            child: DropdownMenu<String>(
              initialSelection: itemTracker.getSelectedSubcategoryId(),
              onSelected: (String? subcategory) {
                itemTracker.updateSelectedSubcategoryById(subcategory);
              },
              dropdownMenuEntries: itemTracker.getSubcategoryMenuEntries(),
              enabled: tracker.selectedCategory,
            ),
          ),
        ],
      );
    });
  }

  static Widget itemListContentFrame(BuildContext context) {
    var itemTracker = context.read<ItemTracker>();

    return Container(
      color: COLORS["windowBackground"],
      child: Center(child: Texts.emptyPageText("This here's the itemlist")),
    );
  }
}
