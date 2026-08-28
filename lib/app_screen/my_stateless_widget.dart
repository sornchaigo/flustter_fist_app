import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  final String title;
  // constuctor
  MyStatelessWidget({Key? key, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title, textDirection: TextDirection.ltr));
  }
}
