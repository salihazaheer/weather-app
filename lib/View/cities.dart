import 'dart:html';

import 'package:flutter/material.dart';
import 'package:weather_app/View/weatherapp.dart';

import '../controller/APIMANAGER/widgets.dart';

final citycontroller = TextEditingController();

class City_Sereen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Weather By City"),
        titleSpacing: 10.0,
        centerTitle: true,
        backgroundColor: Colors.black26,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/free.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  hintText: "enter the city name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 7),
                  ),
                ),
                controller: citycontroller,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                width: 150,
                color: Colors.blueGrey,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  weather_app(citycontroller.text)));
                      // print(citycontroller);
                    },
                    child: Customtext(text: "Search Weather")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
