import 'package:flutter/material.dart';

import 'app_screen/my_statefull_widget.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'First Flutter App',
        home: Scaffold(
            appBar: AppBar(
                title: Text('Welcome to Flutter'),
                backgroundColor: Colors.green
            ),
            body: Material(
                color: Colors.lightGreen,
                child: Center(
                    child: Text(
                        'Hello World',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        )
                    )
                )
            )
        )
    )
  );
}

