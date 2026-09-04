import 'package:flutter/material.dart';

import 'package:flustter_fist_app/app_screen/first_screen.dart';
import 'package:flustter_fist_app/app_screen/second_screen.dart';
import 'package:flustter_fist_app/app_screen/third_screen.dart';
import 'package:flustter_fist_app/app_screen/fourth_screen.dart';

import 'providers/mycolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyColor(
      color: Colors.red,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'First Flutter App',
        initialRoute: '/', // สามารถใช้ home แทนได้
        routes: {
          FirstScreen.ROUTE_NAME: (context) => FirstScreen(), // Home Screen
          SecondScreen.ROUTE_NAME: (context) => SecondScreen(),
          ThirdScreen.ROUTE_NAME: (context) =>
              ThirdScreen(selectedWord: "Third Screen"),
          FourthScreen.ROUTE_NAME:(context) => FourthScreen(),
        },
      ),
    );
  }
}
