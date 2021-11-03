import 'package:flutter/material.dart';
import 'package:m_menu/resource/resource.dart';

class Foods extends StatefulWidget {
  const Foods({Key? key}) : super(key: key);

  @override
  _FoodsState createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  int selectedElement = 0;
  var firstList = [
    '1 - Ovqat',
    '2 - Ovqat',
    'Disert',
    'Ichimliklar',
    'Salatlar'
  ];
  @override
  Widget build(BuildContext context) {
    var displaySize = MediaQuery.of(context).size;
    //
    void _setIndex(int i) {
      setState(() {
        selectedElement = i;
      });
    }

    //
    Widget foodType(int a) {
      return GestureDetector(
        onTap: () {
          _setIndex(a);
        },
        child: Container(
          width: displaySize.width / 100 * 30,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: (a == selectedElement) ? Colors.amber.shade400 : null,
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(displaySize.height / 100 * 4),
          ),
          child: Center(
            child: Text(
              firstList[a],
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
    }

    //
    Widget foods(Food food) {
      return Container(
        clipBehavior: Clip.hardEdge,
        height: displaySize.height / 100 * 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(food.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              food.name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("${food.value} so'm")
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Karimbek',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Column(
        children: [
          SizedBox(
            height: displaySize.height / 100 * 8,
            child: ListView.builder(
              itemBuilder: (_, index) {
                return foodType(index);
              },
              itemCount: firstList.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                crossAxisCount: 2,
                children:
                    listSecond[selectedElement].map((e) => foods(e)).toList(),
                childAspectRatio: 0.88,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
