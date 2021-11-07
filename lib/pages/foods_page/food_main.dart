import 'package:flutter/material.dart';
import 'package:m_menu/resource/resource.dart';

class FoodMain extends StatefulWidget {
  static var id = 'foods_page/food_main_page';
  const FoodMain({Key? key}) : super(key: key);

  @override
  _FoodMainState createState() => _FoodMainState();
}

class _FoodMainState extends State<FoodMain> {
  var listChanges = <Map<String, int>>[
    {'Guruch': 200},
    {'Sabzi': 400},
    {"Yog'": 50},
  ];
  @override
  Widget build(BuildContext context) {
    Widget _change() {
      return Container(
        color: Colors.black,
      );
    }

    var displaySize = MediaQuery.of(context).size;
    final food = ModalRoute.of(context)!.settings.arguments as Food;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: displaySize.height / 100 * 5),
            Image(
              image: AssetImage(food.image),
            ),
            SizedBox(height: displaySize.height / 100 * 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: listChanges.map((e) => _change()).toList(),
                  childAspectRatio: 3.1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
