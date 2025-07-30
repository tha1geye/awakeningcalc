
import 'package:awakening_calc/app_data/dirty_json_faker.dart';
import 'package:awakening_calc/model/category.dart';
import 'package:awakening_calc/model/item_tree.dart';
import 'package:awakening_calc/util/debug_printer.dart';
import 'package:flutter/material.dart';

class SimpleStateController {
  DebugPrinter printer = const DebugPrinter(moduleName: "SimpleStateController");
  DirtyJSONFaker backEnd = DirtyJSONFaker();
  ItemTree itemTree = ItemTree();

  SimpleStateController(){
    printer.debugPrint("Constructor--- Constructed...");
    load();
  }

  void load(){
    printer.debugPrint("load--- begin");
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
    printer.debugPrint("getTopLevelCategories--- started");
    return itemTree.getTopLevelCategories();
  }

  List<Category> getSubcategoriesOf(Category category){
    printer.debugPrint("getSubcategoriesOf--- started");
    return itemTree.getChildCategoriesOf(category.id);
  }

  Category? getCategoryById(String id){
    printer.debugPrint("getCategoryById--- started");
    return itemTree.findCategoryByID(id);
  }
}

class DropdownInfoPacket{
  List<DropdownMenuEntry<String>> menuEntries;
  String id;
  String text;
  DropdownInfoPacket({required this.menuEntries, required this.id, required this.text});
}

class DropdownUpdatePacket{
  String id;
  DropdownUpdatePacket({required this.id});
}
