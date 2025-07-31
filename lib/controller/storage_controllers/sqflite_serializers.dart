

import 'package:awakening_calc/controller/dockeys.dart';
import 'package:awakening_calc/model/category.dart';

import '../../util/debug_printer.dart';

class CategorySerializer {
  static DebugPrinter printer =
      const DebugPrinter(moduleName: "CategorySerializer",);

  static Category deserialize(Map<String, dynamic> map) {
    printer.debugPrint("deserialize");

    Category temp = Category(
      title: map[DocKeyCategory.title] as String,
      hasItemChildren: map[DocKeyCategory.hasItemChildren] as int == 1,
      isTopLevel: map[DocKeyCategory.isTopLevel] as int == 1,
      id: map[DocKeyCategory.id] as int,
    );

    printer.debugPrint("Deserializing: $temp");

    return temp;
  }

  static Map<String, dynamic> serialize(Category category) {
    // printer.debugPrint("Serializing Todo ${todo.toString()}");

    var map = <String, Object?>{
      DocKeyCategory.title: category.title,
      DocKeyCategory.hasItemChildren: category.hasItemChildren == true ? 1 : 0,
      DocKeyCategory.isTopLevel: category.isTopLevel == true ? 1 : 0,
    };

    if (!(category.id == null || category.id == -1)) {
      map[DocKeyCategory.id] = category.id;
    }

    printer.debugPrint("Map: $map");

    return map;
  }
}



