import 'package:awakening_calc/view/components/panels.dart';
import 'package:flutter/material.dart';

import '../../app_data/constants.dart';

class ContentFrames {
  static Column itemContentFrame() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            categorySelectionContentFrame(),

            // item selection drop down
            // spacer
            // add button
          ],
        ),
        // the next panel will be dynamic based on the category and sub-cat selected above
      ],
    );
  }

  static Widget categorySelectionContentFrame() {
    List<DropdownMenuEntry<int>> dropdownMenuEntries = [
      DropdownMenuEntry(value: 1, label: "Garment"),
      DropdownMenuEntry(value: 2, label: "Weapon"),
    ];

    String? _selectedMainCategory;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text("Select a category"),
        DropdownMenu<String>(
          initialSelection: _selectedMainCategory,
          // onSelected: (String? value){
          //   setState(() {
          //     _selectedMainCategory = value;
          //   })
          // },
          dropdownMenuEntries: CATEGORIES.keys.map<DropdownMenuEntry<String>>(
            (String key) {
              return DropdownMenuEntry(
                value: key,
                label: key.toUpperCase(),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
