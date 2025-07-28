
  import 'dart:ui';

import 'package:flutter/material.dart';

const APP_NAME = "Hillbilly Awakenin";

  // Page Names
  const HOME_PAGE_NAME = "Home";
  const INFO_PAGE_NAME = "Information";
  const CALC_PAGE_NAME = "Calculator";

  const Map<String, Color> COLORS = {
    'windowBackground' : Colors.black54,
    'titleBackground' : Colors.black87,
  };

  const Map <String, dynamic> CATEGORIES = {
    'Garment' : {
      'title' : 'Garment',
      'children' : {
        "Heavy Armor",
        "Light Armor",
        "Utility",
        "Exploration",
        "Social",
        "Stillsuits",
        "Water Discipline",
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



