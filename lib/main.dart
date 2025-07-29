import 'package:flutter/material.dart';

import 'package:awakening_calc/view/pages/map_page.dart';
import 'package:awakening_calc/view/pages/home_page.dart';
import 'package:awakening_calc/view/pages/item_page.dart';
import 'package:provider/provider.dart';
import 'app_data/constants.dart';
import 'controller/simple_state_controller.dart';
import 'util/debug_printer.dart';

const DebugPrinter printer = DebugPrinter(moduleName: "Main");


void main() {
  printer.debugPrint("App Execution beginning");
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
