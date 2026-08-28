import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'second_screen.dart';
import 'third_screen.dart';

class FirstScreen extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        child:
            _randomWord.length >
                0 // กำหนดเงื่อนไขตรงนี้
            ? ListView.separated(
                // กรณีมีรายการ แสดงปกติ
                itemCount: _randomWord.length,
                itemBuilder: _buildRow,
                separatorBuilder: (context, index) => const Divider(),
              )
            : const Center(child: Text('No items')), // กรณีไม่มีรายการ
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: _addRandomWord,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildRow(context, index) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('${_randomWord[index].asPascalCase}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThirdScreen()),
              );
            },
          ),
          // const Divider(),
        ],
      ),
    );
  }
}
