import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ThirdScreen();
  }
}

class _ThirdScreen extends State<ThirdScreen> {
  // รูปแบบการแสดงข้อความ
  final _biggerFont = const TextStyle(color: Colors.black, fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    // รับค่า arguments ที่ส่งมาใช้งาน
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(child: Text(args['msg'], style: _biggerFont)),
    );
  }
}
