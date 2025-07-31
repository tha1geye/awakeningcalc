import 'package:awakening_calc/model/category.dart';
import 'package:sqflite/sqflite.dart';

abstract class StorageControllerInterface {
  Future<void> init() async {
    throw UnimplementedError();
  }

  Future firstRunLoad() async {
    throw UnimplementedError();
  }

  /*----------------------------------------------------------------------------
  Category FUNCTIONS
  ----------------------------------------------------------------------------*/
  Future<List<Category>?> getCategoryList() async {
    throw UnimplementedError();
  }

  Future<Category?> getCategory(int id) async {
    throw UnimplementedError();
  }

  Future<Category> insertCategory(Category category) async {
    throw UnimplementedError();
  }

  Future deleteCategory(Category category) async {
    throw UnimplementedError();
  }

  Future updateCategory(Category category) async {
    throw UnimplementedError();
  }


  /*       <DB Specific Functions>      */
  Future openDB() async {
    throw UnimplementedError();
  }

  Future getDbPath() async {
    throw UnimplementedError();
  }

  Future createDB(Database db, int version) async {
    throw UnimplementedError();
  }

  Future createCategoryTable() async {
    throw UnimplementedError();
  }

  Future close() async {
    throw UnimplementedError();
  }
}