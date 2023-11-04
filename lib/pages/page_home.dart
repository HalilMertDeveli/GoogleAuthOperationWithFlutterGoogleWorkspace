import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
//    final Map<dynamic,dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
//     final String receivedData1 = args['data1'];
// final String receivedData2 = args['data2']
// final String receivedData3 = args['data3']; // continue next time in here

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home Page")
        ],
      ),
    );
  }
}