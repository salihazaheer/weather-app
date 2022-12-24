import 'dart:html';

import 'package:flutter/material.dart';
import 'package:weather_app/View/cities.dart';

import 'package:weather_app/View/weatherapp.dart';

void main() {
  runApp(const weather());
}

class weather extends StatefulWidget {
  const weather({Key? key}) : super(key: key);

  @override
  State<weather> createState() => _weatherState();
}

class _weatherState extends State<weather> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: City_Sereen(),
      // home: Scaffold(
      //   body: Center(
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Text(
      //           "Check Todays Weather",
      //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Text("please press the button",
      //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             primary: Colors.black,
      //             textStyle: TextStyle(fontSize: 20),
      //             padding: EdgeInsets.all(10),
      //             side: BorderSide(color: Colors.white, width: 1),
      //           ),
      //           onPressed: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => app(),
      //                 ));
      //           },
      //           child: Text(
      //             "click Me",
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
