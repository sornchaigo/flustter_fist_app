import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'package:flustter_fist_app/providers/mycolor.dart';

import '../components/sidemenu.dart';
import 'second_screen.dart';
import 'third_screen.dart';
import 'fourth_screen.dart';

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
  final List<WordPair> _randomWord = <WordPair>[];
  final List<WordPair> _favorite = <WordPair>[];

  void _addRandomWord() {
    setState(() {
      _randomWord.addAll(generateWordPairs().take(3).toList());
    });
  }

  void _clearRandomWord() {
    setState(() {
      _randomWord.clear();
      _favorite.clear();
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
    final state = MyColor.of(context);
    final color = state.color;

    if (_randomWord.isEmpty) {
      _loadRamdomWord();
    }
    // TODO: implement build
    return Scaffold(
      drawer: SideMenu(),

      appBar: AppBar(
        title: Text('Welcome to Flutter'),
        // backgroundColor: color,
        backgroundColor: Theme.of(context).primaryColor,
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
              Navigator.pushNamed(
                context,
                SecondScreen.ROUTE_NAME,
                arguments: _favorite,
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SecondScreen()),
              // );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.pushNamed(context, FourthScreen.ROUTE_NAME);
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
            var word = _randomWord[index];
            return _buildRow(context, word);
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        onPressed: _addRandomWord,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildRow(context, word) {
    bool _alreadyFavorite = _favorite.contains(word);

    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('${word.asPascalCase}'),
            trailing: Icon(
              _alreadyFavorite ? Icons.favorite : Icons.favorite_border,
              color: _alreadyFavorite ? Colors.red : null,
            ),
            onTap: () {
              _showYourChoice(context, word);
            },
          ),
          // const Divider(),
        ],
      ),
    );
  }

  _showYourChoice(context, word) async {
    // กำหนดรูปแบบข้อมูลเป็นแบบ Map
    Map<String, dynamic> args = {"msg": word.asPascalCase.toString()};
    final result = await Navigator.pushNamed(
      context,
      ThirdScreen.ROUTE_NAME,
      arguments: args,
    );

    setState(() {
      if (result == 'Yep!') {
        if (!_favorite.contains(word)) {
          _favorite.add(word);
        }
      } else {
        _favorite.remove(word);
      }
    });

    String messge = "you say ${result}";
    // ส่วนสำหรับแสดงข้อความด้านล่างขอบหน้าจอ
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(messge)));
  }
}
