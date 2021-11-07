import 'package:flutter/material.dart';
import 'package:m_menu/resource/resource.dart';

class AllFoods extends StatefulWidget {
  int i;
  static var id = 'all_foods';
  AllFoods({Key? key, required this.i}) : super(key: key);

  @override
  _AllFoodsState createState() => _AllFoodsState();
}

class _AllFoodsState extends State<AllFoods> {
  int selectedElement = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedElement = widget.i;
  }

  @override
  Widget build(BuildContext context) {
    var displaySize = MediaQuery.of(context).size;
    var controller = PageController(initialPage: selectedElement);
    //
    void _setIndex(int i) {
      setState(() {
        selectedElement = i;
        controller.jumpToPage(i);
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
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            'foods_page/food_main_page',
            arguments: food,
          );
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 20,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(food.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        centerTitle: true,
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
            child: PageView.builder(
              controller: controller,
              onPageChanged: (item) {
                setState(() {
                  selectedElement = item;
                });
              },
              itemCount: firstList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: listSecond[index].map((e) => foods(e)).toList(),
                    childAspectRatio: 0.85,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
