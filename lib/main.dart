import 'package:flutter/material.dart';

import 'app_screen/first_screen.dart';
import 'app_screen/second_screen.dart';
import 'app_screen/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Flutter App',
      // home: FirstScreen()
      routes: {
        FirstScreen.ROUTE_NAME: (context) => FirstScreen(),          // Home Screen 
        SecondScreen.ROUTE_NAME: (context) => SecondScreen(),
        ThirdScreen.ROUTE_NAME: (context) => ThirdScreen(selectedWord: "Third Screen"),
      },
    );
  }
}
