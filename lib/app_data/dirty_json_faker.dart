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
        id: 'garm',
        children: [
          'heavArm',
          'ligArm',
          'garmUtil',
          'garmExpo',
          'garmSoc',
          'stillSt',
          'wtrDscp',
        ],
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
        id: 'heavArm',
        hasItemChildren: true,
      ),
      Category(
        title: "Light Armor",
        id: 'ligArm',
        hasItemChildren: true,
      ),
      Category(
        title: "Utility",
        id: 'garmUtil',
        hasItemChildren: true,
      ),
      Category(
        title: "Exploration",
        id: 'garmExpo',
        hasItemChildren: true,
      ),
      Category(
        title: "Social",
        id: 'garmSoc',
        hasItemChildren: true,
      ),
      Category(
        title: "Stillsuits",
        id: 'stillSt',
        hasItemChildren: true,
      ),
      Category(
        title: "Water Discipline",
        id: 'wtrDscp',
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
