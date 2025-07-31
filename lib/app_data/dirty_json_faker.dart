import 'package:awakening_calc/model/category.dart';
import 'package:awakening_calc/util/debug_printer.dart';

class DirtyJSONFaker {
  DebugPrinter printer = const DebugPrinter(moduleName: "DirtyJSONFaker");
  late List<Category> categories;

  void load() {
    printer.debugPrint("load--- starting");
    loadCategories();
    loadItems();

    printer.debugPrint("load--- complete");
  }

  void loadCategories() {
    printer.debugPrint("loadCategories--- started");

    categories = [
      Category(
        title: "Garment",
        hasItemChildren: false,
        isTopLevel: true,
      ),
      Category(title: "Utility", hasItemChildren: false, isTopLevel: true,),
      Category(title: "Misc", hasItemChildren: false, isTopLevel: true,),
      Category(title: "Raw Resource", hasItemChildren: false, isTopLevel: true,),
      Category(title: "Weapons", hasItemChildren: false, isTopLevel: true,),
      Category(title: "Vehicles", hasItemChildren: false, isTopLevel: true,),
      Category(title: "Construction", hasItemChildren: false, isTopLevel: true,),
      Category(title: "Customization", hasItemChildren: false, isTopLevel: true,),
      Category(title: "Contract", hasItemChildren: false, isTopLevel: true,),
    ];

    var garmSubs = [
      Category(
        title: "Heavy Armor",
        hasItemChildren: true,
      ),
      Category(
        title: "Light Armor",
        hasItemChildren: true,
      ),
      Category(
        title: "Utility",
        hasItemChildren: true,
      ),
      Category(
        title: "Exploration",
        hasItemChildren: true,
      ),
      Category(
        title: "Social",
        hasItemChildren: true,
      ),
      Category(
        title: "Stillsuits",
        hasItemChildren: true,
      ),
      Category(
        title: "Water Discipline",
        hasItemChildren: true,
      ),
    ];
    categories.addAll(garmSubs);

    printer.debugPrint("loadCategories--- complete");
  }

  void loadItems() {
    printer.debugPrint("loadItems--- begin");

    printer.debugPrint("loadItems--- complete");
  }

  List<Category> getCategories() {
    return categories;
  }
}
