import 'package:flutter/material.dart';

import 'app_screen/first_screen.dart';

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
      home: FirstScreen()
    );
  }
}
