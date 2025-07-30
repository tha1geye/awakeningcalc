
import 'package:awakening_calc/view/components/rows.dart';
import 'package:awakening_calc/view/components/spacers.dart';
import 'package:awakening_calc/view/components/texts.dart';
import '../../app_data/constants.dart';
import '../../controller/item_tracker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
    return Consumer<ItemTracker>(builder: (context, tracker, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Rows.dropdownMenuRow(
            title: "Select a category",
            child: DropdownMenu<String>(
              initialSelection: tracker.getSelectedCategoryId(),
              onSelected: (String? categoryId) {
                tracker.updateSelectedCategoryById(categoryId);
              },
              dropdownMenuEntries: tracker.getCategoryMenuEntries(),
            ),
          ),
          Spacers.outerFieldSpacer(),
          Rows.dropdownMenuRow(
            title: "Select a Subcategory",
            child: DropdownMenu<String>(
              initialSelection: tracker.getSelectedSubcategoryId(),
              onSelected: (String? subcategoryId) {
                tracker.updateSelectedSubcategoryById(subcategoryId);
              },
              dropdownMenuEntries: tracker.getSubcategoryMenuEntries(),
            ),
          ),
        ],
      );
    });
  }

  static Widget itemListContentFrame(BuildContext context) {
    return Container(
      color: COLORS["windowBackground"],
      child: Center(child: Texts.emptyPageText("This here's the itemlist")),
    );
  }
}
