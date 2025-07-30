
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/simple_state_controller.dart';
import '../../model/category.dart';

class DropdownMenus {
//   static Widget categorySelectionDropdownMenu(BuildContext context){
//     Category _selectedCategory;
//
//     return Consumer<ItemTracker>(builder: (context, tracker, child) { => DropdownMenuEntry<String>(
//       initalSelection: _selectedCategory.title,
//       onSelected: (String? subcategory) {
//         tracker.updateSelectedSubCategoryById(subcategory);
//       },
//       dropdownMenuEntries: tracker.getSubCategoryMenuEntries(),
//       );
//     },
//     );
//   }
}

// Consumer<ItemTracker>(
//   builder: (context, tracker, child) => DropdownMenu<String>(
//     initialSelection: _selectedSubCategoryString,
//     onSelected: (String? subcategory) {
//       itemTracker.updateSelectedSubCategoryById(subcategory);
//     },
//     dropdownMenuEntries: tracker.getSubCategoryMenuEntries(),
//   ),
// )