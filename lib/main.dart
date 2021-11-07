import 'package:flutter/material.dart';
import 'package:m_menu/pages/foods_page/all_foods_page.dart';
import 'package:m_menu/pages/foods_page/food_main.dart';
import 'package:m_menu/pages/foods_page/foods.dart';

import 'pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const HomePage(),
      routes: {
        Foods.id: (context) => const Foods(),
        FoodMain.id: (context) => const FoodMain(),
        AllFoods.id: (context) {
          final i = ModalRoute.of(context)!.settings.arguments as int;
          return AllFoods(i: i);
        },
      },
    );
  }
}
