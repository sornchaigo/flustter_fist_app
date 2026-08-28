import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
        backgroundColor: Colors.green,
      ),
      body: Material(
        color: Colors.lightGreen,
        child: Center(
          child: Text(
            'Hello World',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
