import 'package:flutter/material.dart';

import '../providers/mycolor.dart';

class FourthScreen extends StatefulWidget {
  static const ROUTE_NAME = '/fourth';

  @override
  State<StatefulWidget> createState() {
    return _FourthScreen();
  }
}

class _FourthScreen extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    final state = MyColor.of(context);
    final color = state.color;

    return Scaffold(
      appBar: AppBar(title: Text('Fourth Screen'), backgroundColor: color, ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Fourth Screen'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => state.setColor(Colors.green),
                child: Text('Default'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: state.setBlue,
                child: Text('SetBlue'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: state.setRed,
                child: Text('SetRed'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
