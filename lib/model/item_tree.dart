import 'package:flutter/material.dart';

class ItemTree {

  static Map <String, dynamic> categories = {
    'Garment' : {
      'title' : 'Garment',
      'children' : {
        'Heavy Armor' : {},
        'Light Armor' : {},
        'Utility' : {},
        'Exploration' : {},
        'Social' : {},
        'Stillsuits' : {},
        'Water Discipline' : {},
      },
    },
    'Utility' : {
      'title' : 'Utility',
      'children' : {}
    },
    'Misc' : {
      'title' : 'Misc',
      'children' : {}
    },
    'Raw Resource' : {
      'title' : 'Raw Resource',
      'children' : {
        'Ore' : {},
      }
    },
    'Weapons' : {
      'title' : 'Weapons',
      'children' : {},
    },
    'Vehicles' : {
      'title' : 'Vehicles',
      'children' : {},
    },
    'Construction' : {'title' : 'Construction', 'children' : {},},
    'Customization' : {'title' : 'Customization', 'children' : {},},
    'Contract' : {'title' : 'Contract', 'children' : {},},
  };

  static List<DropdownMenuEntry<String>> getCategoryMenuEntries() {
    return categories.keys.map<DropdownMenuEntry<String>>(
        (String key) {
          return DropdownMenuEntry(value: key, label: key.toUpperCase());
        }
    ).toList();
  }

  static List<DropdownMenuEntry<String>> getSubCategoryMenuEntries(String parentKey) {
    return categories[parentKey]['children'].keys.map<DropdownMenuEntry<String>>(
            (String key) {
          return DropdownMenuEntry(value: key, label: key.toUpperCase());
        }
    ).toList();
  }

}