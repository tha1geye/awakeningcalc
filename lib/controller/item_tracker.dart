import 'package:awakening_calc/controller/simple_state_controller.dart';
import 'package:flutter/material.dart';

import '../model/category.dart';
import '../util/debug_printer.dart';

class ItemTracker with ChangeNotifier {
  SimpleStateController stateController = SimpleStateController();
  DebugPrinter printer = const DebugPrinter(moduleName: "ItemTracker");

  DropdownMenuEntry<String> noCategory = const DropdownMenuEntry(
    value: 'none',
    label: "Select a category",
  );
  DropdownMenuEntry<String> errorEntry = const DropdownMenuEntry(
    value: 'none',
    label: "There's been an error",
  );

  Category? selectedCategory;
  Category? selectedSubcategory;
  String? selectedCategoryString;
  String? selectedSubcategoryString;
  String? selectedItem;

  ItemTracker(){
    printer.debugPrint("Constructor--- starting");
    selectedCategory = stateController.getTopLevelCategories()[0];

  }


  // Category? getSelectedCategory() {
  //   return selectedCategory;
  // }

  String? getSelectedCategoryId() {
    return selectedCategory?.id;
  }

  List<DropdownMenuEntry<String>> getCategoryMenuEntries() {
    // always returns the category list, since entries don't need to be dynamic
    return stateController.getTopLevelCategories().map((Category category) {
      return DropdownMenuEntry(value: category.id, label: category.title);
    }).toList();
  }

  void updateSelectedCategory(Category? category) {
    printer.debugPrint("updateSelectedCategory--- updating");

    if (category != null) {
      selectedCategory = category;
      selectedCategoryString = category.id;
      notifyListeners();
      printer.debugPrint("--- successful");
    } else {
      printer.debugPrint("--- new category is null");
    }
  }

  void updateSelectedCategoryById(String? id) {
    printer.debugPrint("updateSelectedCategoryById--- updating category");

    if (id == null) {
      printer.debugPrint("--- id is null");
      return;
    }

    Category? newCategory = stateController.getCategoryById(id);
    if (newCategory != null) {
      printer.debugPrint(
          'updateSelectedCategoryById--- rxed category from statecontroller');
      printer.debugPrint('--- category: id- ${newCategory!.id}');
      updateSelectedCategory(newCategory);
      updateSelectedSubcategory(null);
      notifyListeners();
    } else {
      printer.debugPrint(
          'updateSelectedCategoryById--- category rxed from statecontroller is null');
    }
  }

  Category? getSelectedSubcategory() {
    return selectedSubcategory!;
  }

  String? getSelectedSubcategoryId() {
    return selectedSubcategory?.id;
  }

  List<DropdownMenuEntry<String>> getSubcategoryMenuEntries() {
    printer.debugPrint("getSubcategoryMenuEntries--- started");

    if (selectedCategory == null) {
      printer.debugPrint("--- selectedCategory is null");
      return [
        const DropdownMenuEntry(
          value: 'none',
          label: "Select a category",
        ),
      ];
    } else {
      // returns the subcategories of the selected category
      printer.debugPrint("--- creating DropdownMenuEntry list");

      List<Category> temp = stateController.getSubcategoriesOf(selectedCategory!);

      if(temp.isEmpty){
        return [
          const DropdownMenuEntry(
            value: 'none',
            label: "No Subcategories",
          ),
        ];
      }

      return stateController
          .getSubcategoriesOf(selectedCategory!)
          .map((Category category) {
        return DropdownMenuEntry(value: category.id, label: category.title);
      }).toList();
    }
  }

  void updateSelectedSubcategory(Category? subCategory) {
    printer.debugPrint("updateSelectedSubcategory--- started");
    selectedSubcategory = subCategory;
    notifyListeners();
  }

  void updateSelectedSubcategoryById(String? subcategory) {
    if (subcategory == null) {
      return;
    }
    selectedSubcategory = stateController.getCategoryById(subcategory);

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

}
