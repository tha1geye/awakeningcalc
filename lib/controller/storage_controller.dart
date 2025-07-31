
import '../model/category.dart';
import '../util/debug_printer.dart';
import 'sqflite_controller.dart';

class StorageController {
  static DebugPrinter printer = const DebugPrinter( moduleName: "StorageController",);

  static late SQFLiteController controller;

  StorageController() {
    controller = SQFLiteController();
  }

  Future<void> init() async {
    await controller.openDB();
  }

  /*      <Category Functions>      */
  static Future<List<Category>?> getCategoryList() async {
    printer.debugPrint("getCategoryList");

    try {
      printer.debugPrint("returning Category List");
      return await controller.getCategoryList();
    } catch (e) {
      printer.debugPrint("Error getting Category List: $e");
    }

    return Future.value(<Category>[]);
  }

  static Future addCategory(Category category) async {
    try {
      category = await controller.insertCategory(category);
      return category;
    } catch (e) {
      printer.debugPrint("Error Inserting Category: $e");
    }
  }

  static Future updateCategory(Category category) async {
    printer.debugPrint("updateCategory");

    try {
      await controller.updateCategory(category);
    } catch (e) {
      printer.debugPrint("Error updating Todo: $e");
    }
  }

  static Future deleteCategory(Category category) async {
    printer.debugPrint("deleteCategory");

    try {
      await controller.deleteCategory(category);
    } catch (e) {
      printer.debugPrint("Error deleting category: $e");
    }
  }
}
