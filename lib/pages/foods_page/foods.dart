import 'package:flutter/material.dart';
import 'package:m_menu/pages/foods_page/all_foods_page.dart';
import 'package:m_menu/resource/resource.dart';

class Foods extends StatefulWidget {
  static var id = 'foods_page';
  const Foods({Key? key}) : super(key: key);

  @override
  _FoodsState createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  int selectedElement = 0;
  var controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    //
    var displaySize = MediaQuery.of(context).size;
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
          margin: const EdgeInsets.all(10),
          width: displaySize.width / 100 * 36,
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

    //
    Widget _typeFoods(int i) {
      return SizedBox(
        height: displaySize.height / 100 * 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              firstList[i],
              style: TextStyle(
                fontSize: displaySize.height / 100 * 3,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AllFoods.id, arguments: i);
              },
              child: Row(
                children: [
                  Text(
                    'All',
                    style: TextStyle(fontSize: displaySize.height / 100 * 2),
                    textAlign: TextAlign.center,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: displaySize.height / 100 * 2,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget _listTypeFoods(int i) {
      return SizedBox(
        height: displaySize.height / 100 * 24,
        child: ListView.builder(
          itemCount: listSecond[i].length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, j) {
            return foods(
              listSecond[i][j],
            );
          },
        ),
      );
    }

    //
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Karimbek',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) {
                  return Column(
                    children: [_typeFoods(i), _listTypeFoods(i)],
                  );
                },
                childCount: firstList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// var displaySize = MediaQuery.of(context).size;
//     //
//     void _setIndex(int i) {
//       setState(() {
//         selectedElement = i;
//         controller.jumpToPage(i);
//       });
//     }
//     //
//     Widget foodType(int a) {
//       return GestureDetector(
//         onTap: () {
//           _setIndex(a);
//         },
//         child: Container(
//           width: displaySize.width / 100 * 30,
//           margin: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: (a == selectedElement) ? Colors.amber.shade400 : null,
//             border: Border.all(width: 1, color: Colors.grey),
//             borderRadius: BorderRadius.circular(displaySize.height / 100 * 4),
//           ),
//           child: Center(
//             child: Text(
//               firstList[a],
//               style: const TextStyle(
//                   color: Colors.black, fontWeight: FontWeight.w500),
//             ),
//           ),
//         ),
//       );
//     }

//     //



//     Widget foods(Food food) {
//       return GestureDetector(
//         onTap: () {
//           Navigator.pushNamed(
//             context,
//             'foods_page/food_main_page',
//             arguments: food,
//           );
//         },
//         child: Container(
//           clipBehavior: Clip.hardEdge,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.shade300,
//                 blurRadius: 20,
//               ),
//             ],
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       image: AssetImage(food.image),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       food.name,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text("${food.value} so'm")
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }

// return Scaffold(
//   backgroundColor: Colors.blueGrey.shade100,
//   appBar: AppBar(
//     centerTitle: true,
//     title: const Text(
//       'Karimbek',
//       style: TextStyle(color: Colors.black),
//     ),
//     backgroundColor: Colors.amber.shade400,
//   ),
//   body: Column(
//     children: [
//       SizedBox(
//         height: displaySize.height / 100 * 8,
//         child: ListView.builder(
//           itemBuilder: (_, index) {
//             return foodType(index);
//           },
//           itemCount: firstList.length,
//           scrollDirection: Axis.horizontal,
//         ),
//       ),
//       Expanded(
//         child: PageView.builder(
//           controller: controller,
//           onPageChanged: (item) {
//             setState(() {
//               selectedElement = item;
//             });
//           },
//           itemCount: firstList.length,
//           itemBuilder: (_, index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 children: listSecond[index].map((e) => foods(e)).toList(),
//                 childAspectRatio: 0.85,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//               ),
//             );
//           },
//         ),
//       )
//     ],
//   ),
// );
