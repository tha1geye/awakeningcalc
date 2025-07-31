import 'package:awakening_calc/controller/dockeys.dart';
import 'package:awakening_calc/controller/storage_controllers/sqflite_serializers.dart';
import 'package:awakening_calc/controller/storage_controllers/storagecontroller_interface.dart';
import 'package:awakening_calc/model/category.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

import '../util/debug_printer.dart';

class SQFLiteController implements StorageControllerInterface {
  static DebugPrinter printer = const DebugPrinter(
    moduleName: "SQFLiteController",
  );
  final String _moduleName = "SQFLite Controller";

  Database? db;
  final String dbName = "db.db";
  final String categoryTable = DocKeyCategory.tableName;
  final String idColumn = DocKeyCategory.id;
  final String titleColumn = DocKeyCategory.title;
  final String childrenColumn = DocKeyCategory.children;
  final String hasItemChildrenColumn = DocKeyCategory.hasItemChildren;
  final String isTopLevelColumn = DocKeyCategory.isTopLevel;

  SQFLiteController() {
    printer.debugPrint("Instantiated SQFLiteController");
  }

  @override
  Future<void> init() async {
    const String methodName = "init";
    printer.debugPrint("Initializing SQFLite DB");

    try {
      await openDB();
    } catch (e) {
      throw "$_moduleName: $methodName: Initialization Error: $e";
    }
  }

  @override
  Future firstRunLoad() async {
    printer.debugPrint("firstRunLoad");
  }

  /*      <Category FUNCTIONS>     */
  @override
  Future<List<Category>?> getCategoryList() async {
    const String methodName = "getCategoryList";

    List<Map<String, dynamic>> maps = [];
    List<Category> temp = [];

    try {
      // printer.debugPrint("Opening database");

      await openDB();
      maps = await db!.query(
        categoryTable,
        columns: [idColumn, titleColumn, childrenColumn, hasItemChildrenColumn, isTopLevelColumn],
      );

      if (maps.isEmpty) {
        return null;
      }

      for (var element in maps) {
        temp.add(CategorySerializer.deserialize(element));
      }

      await close();

      return temp;
    } catch (e) {
      throw "$_moduleName: $methodName: Error getting Category List: $e";
    }
  }

  @override
  Future<Category?> getCategory(int id) async {
    const String methodName = "getCategory";

    try {
      await openDB();

      List<Map<String, dynamic>> maps = await db!.query(categoryTable,
          columns: [
            idColumn,
            titleColumn,
            childrenColumn,
            hasItemChildrenColumn,
            isTopLevelColumn,
          ],
          where: '$idColumn = ?',
          whereArgs: [id]);

      await close();

      if (maps.isEmpty) {
        return null;
      }

      return CategorySerializer.deserialize(maps.first);
    } catch (e) {
      throw "$_moduleName: $methodName: Error getting Category: $e";
    }
  }

  @override
  Future<Category> insertCategory(Category category) async {
    const String methodName = "insertCategory";

    try {
      await openDB();
      category.id = await db!.insert(
        DocKeyCategory.tableName,
        CategorySerializer.serialize(category),
      );

      await close();

      return category;
    } catch (e) {
      await close();

      printer.debugPrint("Error inserting Category: $e");
      throw "Error Inserting Category: $e";
    }
  }

  @override
  Future deleteCategory(Category category) async {

    await openDB();

    try {
      var result = await db!.delete(DocKeyCategory.tableName,
          where: '$idColumn= ?', whereArgs: [DocKeyCategory.id]);

      await close();

      return result;
    } catch (e) {
      printer.debugPrint("Error Deleting Category: $e");

      await close();
      throw "Error deleting Category during close: $e";
    }
  }

  @override
  Future updateCategory(Category category) async {
    printer.debugPrint("updateCategory");

    try {
      await openDB();
      var result = await db!.update(
          DocKeyCategory.tableName, CategorySerializer.serialize(category),
          where: '$idColumn = ?', whereArgs: [category.id]);
      await close();

      return result;
    } catch (e) {
      throw "Error updating Category: $e";
    }
  }


  /*      <DB Specific Functions>      */
  @override
  Future openDB() async {
    printer.debugPrint("openDB");
    // printer.debugPrint("Opening database");

    // If database is not null, it is already open, do nothing
    if (db != null) {
      // printer.debugPrint("Database already open");
      return;
    }

    String path, fullPath;

    try {
      path = await getDbPath();
      fullPath = join(path, dbName);
      // printer.debugPrint("Trying to open the database");

      db = await databaseFactoryFfi.openDatabase(fullPath);
      if (db == null) {
        printer.debugPrint("This is embarassing. DB is null");
      }

      // printer.debugPrint("Successfully opened db");
    } catch (e) {
      throw "Error opening database: $e";
    }
  }

  @override
  Future<String> getDbPath() async {
    printer.debugPrint("getDbPath");

    String temp;

    try {
      // printer.debugPrint("getting path");
      temp = await getDatabasesPath();
    } catch (e) {
      throw "DB PATH ERROR: $e";
    }

    return temp;
  }

  @override
  Future createDB(Database db, int version) async {
    printer.debugPrint("createDB");
    // printer.debugPrint("Attempting to create the database");

    try {
      await createCategoryTable();
    } catch (e) {
      throw "Error creating a table: $e";
    }
  }

  @override
  Future createCategoryTable() async {
    printer.debugPrint("createTodoTable");

    try {
      await db!.execute('''
            create table $categoryTable ( 
              $idColumn int primary key autoincrement, 
              $titleColumn text not null,
              // $childrenColumn
              $hasItemChildrenColumn integer not null,
              $isTopLevelColumn integer not null)
            ''');
    } catch (e) {
      throw "Error creating Todo Table: $e";
    }
  }

  @override
  Future close() async {
    // if (db != null) {
    //   await db!.close();
    // }
  }
}