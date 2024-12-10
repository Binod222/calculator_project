import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Grid"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            for (int i = 1; i <= 10; i++) ...{
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Card(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      '$i',
                      style: const TextStyle(fontSize: 23, color: Colors.white),
                    )),
                  )),
            }
          ],
        ),
      )),
    );
  }
}
