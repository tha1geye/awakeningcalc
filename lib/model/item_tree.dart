import 'package:awakening_calc/util/debug_printer.dart';
import 'package:flutter/material.dart';

import 'category.dart';

class ItemTree {
  DebugPrinter printer = const DebugPrinter(moduleName: "ItemTree");
  late List<Category> categories;

  ItemTree(){
    printer.debugPrint("constructor--- begin");
    categories = [];

    printer.debugPrint("constructor--- complete");
  }

  void setCategories(List<Category> categories){
    printer.debugPrint("setCategories--- start");
    this.categories.addAll(categories);
    printer.debugPrint("setCategories--- complete");
  }

  // build tree
  void build(){}
  // ------- for each cat in list search subs for id

  // ---- join subs to their cat

  // ---- join items to their subs

  List<Category> getTopLevelCategories(){
    List<Category> topLevelCategories = [];

    for(Category category in categories){
      if(category.isTopLevel){
        topLevelCategories.add(category);
      }
    }
    return topLevelCategories;
  }

  List<Category> getChildCategoriesOf(String id){
    List<Category> children = [];
    Category? parent = findCategoryByID(id);

    if(parent == null || parent.hasItemChildren || parent.children.isEmpty){
      return [];
    }

    for(String childID in parent.children){
      Category? child = findCategoryByID(childID);

      if(child != null){
        children.add(child);
      }
    }
    return children;
  }

  Category? findCategoryByID(String id){
    for(Category category in categories){
      if(category.id == id){
        return category;
      }
    }
    return null;
  }

  // get all items for a given sub

  // get a specific item by title

  // get a specific item by id

  // get all items by tier

}