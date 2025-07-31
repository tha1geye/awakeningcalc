import 'package:flutter/material.dart';
import 'dart:io';

import 'package:awakening_calc/view/pages/map_page.dart';
import 'package:awakening_calc/view/pages/home_page.dart';
import 'package:awakening_calc/view/pages/item_page.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'app_data/constants.dart';
import 'controller/item_tracker.dart';
import 'controller/sqflite_controller.dart';
import 'controller/storage_controllers/storagecontroller_interface.dart';
import 'util/debug_printer.dart';

const DebugPrinter printer = DebugPrinter(moduleName: "Main");


void main() async {
  printer.debugPrint("App Execution beginning");


  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
  }
  databaseFactory = databaseFactoryFfi;

  /*      <Storage>     */
  StorageControllerInterface storageController = SQFLiteController();
  printer.debugPrint("Instantiated storageController");

  try {
    await storageController.init();
    printer.debugPrint("storageController initialized");
  } catch (e) {
    throw "Storage Controller initialization error: $e";
  }




  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemTracker(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ItemPage.routeName: (context) => const ItemPage(),
        MapPage.routeName: (context) => const MapPage(),
      },
    );
  }
}
