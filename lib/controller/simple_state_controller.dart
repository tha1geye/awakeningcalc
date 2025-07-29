import 'package:awakening_calc/model/item_tree.dart';
import 'package:flutter/material.dart';

class SimpleStateController {
  SimpleStateController();
}

class ItemTracker with ChangeNotifier {
  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedItem;

  String getSelectedCategory() {
    if (selectedCategory == null) {
      return "No Category Selected";
    } else {
      return selectedCategory!;
    }
  }

  void updateSelectedCategory(String? category) {
    selectedCategory = category;
    notifyListeners();
  }

  String getSelectedSubCategory() {
    if (selectedSubCategory == null) {
      return "No SubCategory Selected";
    } else {
      return selectedSubCategory!;
    }
  }

  void updateSelectedSubCategory(String? subCategory) {
    selectedSubCategory = subCategory;
    notifyListeners();
  }

  String getSelectedItem() {
    if (selectedItem == null) {
      return "No Item Selected";
    } else {
      return selectedItem!;
    }
  }

  void updateSelectedItem(String? item) {
    selectedItem = item;
    notifyListeners();
  }

  List<DropdownMenuEntry<String>> getCategoryMenuEntries() {
    // always returns the category list, since entries don't need to be dynamic
    return ItemTree.getCategoryMenuEntries();
  }

  DropdownMenuEntry<String> noCategory =
      const DropdownMenuEntry(value: 'none', label: "Select a category");
  DropdownMenuEntry<String> errorEntry =
      const DropdownMenuEntry(value: 'none', label: "There's been an error");

  List<DropdownMenuEntry<String>> getSubCategoryMenuEntries() {
    // returns the subcategories of the selected category
    List<DropdownMenuEntry<String>> list;

    if (selectedCategory == null) {
      list = [
        noCategory,
      ];
    } else {
      list = ItemTree.getSubCategoryMenuEntries(selectedCategory!);
    }

    if (list.isEmpty) {
      list = [
        errorEntry,
      ];
    }
    return list;
  }
}
