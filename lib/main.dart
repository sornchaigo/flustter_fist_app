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
    return MyWidget(
      color: Colors.red,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'First Flutter App',
        // home: FirstScreen()
        routes: {
          FirstScreen.ROUTE_NAME: (context) => FirstScreen(), // Home Screen
          SecondScreen.ROUTE_NAME: (context) => SecondScreen(),
          ThirdScreen.ROUTE_NAME: (context) =>
              ThirdScreen(selectedWord: "Third Screen"),
        },
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  final Widget child;
  final Color color; // property

  // constructor
  const MyWidget({Key? key, required this.color, required Widget this.child})
    : super(key: key);

  static _MyWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_MyWidget>()!;
  }

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Color color = Colors.green;

  @override
  void initState() {
    super.initState();
  }

  void setRed() {
    setState(() {
      color = Colors.red;
    });
  }

  void setBlue() {
    setState(() {
      color = Colors.blue;
    });
  }

  void setGreen() {
    setState(() {
      color = Colors.green;
    });
  }

  void setColor(_color) {
    setState(() {
      color = _color;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _MyWidget(color: color, child: widget.child);
  }
}

// _MyWidget เป็น private
class _MyWidget extends InheritedWidget {
  final Color color; // property

  // constructor
  const _MyWidget({Key? key, required this.color, required Widget child})
    : super(child: child);

  @override
  bool updateShouldNotify(data) => true;
}

// ส่วนของ Stateless widget
class LevelFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final color = context.dependOnInheritedWidgetOfExactType<MyWidget>()!.color;
    final color = MyWidget.of(context).color;
    return Text("Level four", style: TextStyle(color: color));
  }
}
