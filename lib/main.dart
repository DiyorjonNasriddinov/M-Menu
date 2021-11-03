import 'package:flutter/material.dart';
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
      home: HomePage(),
      routes: {
        'foods_page': (context) => const Foods(),
      },
    );
  }
}
