

import 'package:awakening_calc/controller/storage_controllers/storagecontroller_interface.dart';
import 'package:awakening_calc/controller/storage_controllers/subset_storage_controller_interface.dart';

import '../../model/category.dart';

class CategorySubsetStorageController
    implements SubsetStorageControllerInterface {
  late StorageControllerInterface storageController;

  CategorySubsetStorageController({required this.storageController});

  @override
  delete(object) async {
    await storageController.deleteCategory(object as Category);
  }

  @override
  Future<Category?> get(int id) async {
    return await storageController.getCategory(id);
  }

  @override
  Future<List<Category>?> getList() async {
    return await storageController.getCategoryList();
  }

  @override
  Future<Category> insert(object) async {
    return await storageController.insertCategory(object);
  }

  @override
  update(object) async {
    await storageController.updateCategory(object);
  }
}
