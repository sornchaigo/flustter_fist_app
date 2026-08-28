import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  String _randomWord = WordPair.random().asPascalCase;
  final _biggerFont = const TextStyle(color: Colors.black, fontSize: 20.0);

  void _generateWord() {
    setState(() {
      _randomWord = WordPair.random().asPascalCase;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
        backgroundColor: Colors.green,
      ),
      body: ListTile(title: Text(_randomWord, style: _biggerFont)),
    );
  }

}
