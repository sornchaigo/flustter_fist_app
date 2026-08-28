import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ThirdScreen extends StatefulWidget {
  static const ROUTE_NAME = '/third';
  String selectedWord = ''; // กำหนด property สำหรับรับค่า

  ThirdScreen({super.key, required this.selectedWord});

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
      // body: Center(child: Text(widget.selectedWord, style: _biggerFont)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(args['msg'], style: _biggerFont),
            ),
            Text("Do you like this word?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('Yep!'),
                    onPressed: () => Navigator.pop(context, 'Yep!'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text('Nope.'),
                    onPressed: () => Navigator.pop(context, 'Nope.'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
