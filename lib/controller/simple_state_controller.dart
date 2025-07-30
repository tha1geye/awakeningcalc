import 'package:awakening_calc/app_data/dirty_json_faker.dart';
import 'package:awakening_calc/model/category.dart';
import 'package:awakening_calc/model/item_tree.dart';
import 'package:awakening_calc/util/debug_printer.dart';
import 'package:flutter/material.dart';

class SimpleStateController {
  DebugPrinter printer = const DebugPrinter(moduleName: "SimpleStateController");
  ItemTree itemTree = ItemTree();
  DirtyJSONFaker backEnd = DirtyJSONFaker();

  SimpleStateController(){
    printer.debugPrint("Constructor--- Constructed...");
    load();
  }

  void load(){
    printer.debugPrint("load--- begin");
    // ----- this should all eventually move to a BE controller -----
    // open json file
    backEnd.load();

    // parse categories
    List<Category> categories = backEnd.getCategories();
    printer.debugPrint("load--- categories set");
    // parse items

    // set item tree categories
    printer.debugPrint("load--- passing categories to itemtree");
    itemTree.setCategories(categories);
    printer.debugPrint("load--- finished passing categories");


    printer.debugPrint("load--- complete");
  }

  List<Category> getTopLevelCategories(){
    return itemTree.getTopLevelCategories();
  }

  List<Category> getSubcategoriesOf(Category category){
    return itemTree.getChildCategoriesOf(category.id);
  }
}

class ItemTracker with ChangeNotifier {
  SimpleStateController stateController = SimpleStateController();

  DropdownMenuEntry<String> noCategory =
  const DropdownMenuEntry(value: 'none', label: "Select a category");
  DropdownMenuEntry<String> errorEntry =
  const DropdownMenuEntry(value: 'none', label: "There's been an error");

  Category? selectedCategory;
  Category? selectedSubCategory;
  String? selectedItem;

  Category? getSelectedCategory() {
    return selectedCategory;
  }

  void updateSelectedCategory(Category? category) {
    selectedCategory = category;
    notifyListeners();
  }

  Category? getSelectedSubCategory() {
    return selectedSubCategory!;
  }

  void updateSelectedSubCategory(Category? subCategory) {
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
    return stateController.getTopLevelCategories().map((Category category) {
      return DropdownMenuEntry(value: category.title, label: category.title);
    }).toList();
  }

  List<DropdownMenuEntry<String>> getSubCategoryMenuEntries() {
    if(selectedCategory == null){
      return [DropdownMenuEntry(value: 'none', label: "Select a category")];
    }
    else{
      // returns the subcategories of the selected category
      return stateController.getSubcategoriesOf(selectedCategory!).map((Category category) {
        return DropdownMenuEntry(value: category.title, label: category.title);
      }).toList();
    }
}
