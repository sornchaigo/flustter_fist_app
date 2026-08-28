import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SecondScreen extends StatefulWidget {
  static const ROUTE_NAME = '/second';
  const SecondScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SecondScreen();
  }
}

class _SecondScreen extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(child: Text('Second Screen')),
    );
  }
}
