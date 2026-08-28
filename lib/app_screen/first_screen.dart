import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'second_screen.dart';
import 'third_screen.dart';

class FirstScreen extends StatefulWidget {
  static const ROUTE_NAME = "/";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  // String _randomWord = WordPair.random().asPascalCase;
  List<WordPair> _randomWord = <WordPair>[];
  final _biggerFont = const TextStyle(color: Colors.black, fontSize: 20.0);

  void _addRandomWord() {
    setState(() {
      _randomWord.addAll(generateWordPairs().take(3).toList());
    });
  }

  void _clearRandomWord() {
    setState(() {
      _randomWord.clear();
    });
  }

  void _loadRamdomWord() {
    setState(() {
      _randomWord.addAll(generateWordPairs().take(15));
    });
  }

  Future<void> _loadMoreRandomWord() {
    return Future.delayed(Duration(milliseconds: 10), () {
      setState(() {
        _randomWord.addAll(generateWordPairs().take(20));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_randomWord.isEmpty) {
      _loadRamdomWord();
    }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.clear_all),
            tooltip: 'Clear List',
            onPressed: _clearRandomWord,
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            tooltip: "Favorite List",
            onPressed: () {
              Navigator.pushNamed(context, SecondScreen.ROUTE_NAME);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SecondScreen()),
              // );
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.separated(
          // กรณีมีรายการ แสดงปกติ
          itemCount: _randomWord.length,
          itemBuilder: (context, index) {
            if (index == _randomWord.length - 1) {
              _loadMoreRandomWord();
            }
            // เพิ่ม context
            return _buildRow(context, index, _randomWord);
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: _addRandomWord,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildRow(context, index, _randomWord) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('${_randomWord[index].asPascalCase}'),
            onTap: () {
              _showYourChoice(
                context,
                _randomWord[index].asPascalCase.toString(),
              );
            },
          ),
          // const Divider(),
        ],
      ),
    );
  }

  _showYourChoice(context, msg) async {
    // กำหนดรูปแบบข้อมูลเป็นแบบ Map
    Map<String, dynamic> args = {"msg": msg};
    final result = await Navigator.pushNamed(context, ThirdScreen.ROUTE_NAME, arguments: args);

    String messge = "you say ${result} for ${msg}";
    // ส่วนสำหรับแสดงข้อความด้านล่างขอบหน้าจอ
        ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(messge)));
  }
}
