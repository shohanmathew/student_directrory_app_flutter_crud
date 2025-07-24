import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 75, 43),
        foregroundColor: const Color.fromARGB(255, 224, 171, 12),
        title: Text("Student Directory"),
      ),
      floatingActionButton:FloatingActionButton(onPressed: () {
        
      },child: Icon(Icons.add),
        backgroundColor:const Color.fromARGB(255, 79, 143, 254),
        foregroundColor: const Color.fromARGB(255, 182, 229, 235),
        ),
    );
  }
}