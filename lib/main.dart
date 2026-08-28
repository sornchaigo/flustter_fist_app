import 'package:flutter/material.dart';

void main() {
  runApp(
    MyStatelessWidget(text: 'StatelessWidget Example to show immutable data')
  );
}

class MyStatelessWidget extends StatelessWidget {
    final String text;
    // constuctor
    MyStatelessWidget({Key? key, this.text = ''}) : super(key: key);
 
    @override
    Widget build(BuildContext context) {
        return Center(
            child: Text(
                text,
                textDirection: TextDirection.ltr,
            ),
        );
    }
}