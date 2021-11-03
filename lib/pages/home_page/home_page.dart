import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var displaySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan[700],
      body: Center(
        child: SizedBox(
          height: displaySize.height / 100 * 10,
          width: displaySize.width / 100 * 40,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.red[500],
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'foods_page');
            },
            child: const Center(
              child: Text('M-Menu'),
            ),
          ),
        ),
      ),
    );
  }
}
