import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'third_screen.dart';

class SecondScreen extends StatefulWidget {
  static const ROUTE_NAME = '/second';
  const SecondScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SecondScreen();
  }
}

class _SecondScreen extends State<SecondScreen> {
  List<WordPair> _favorite = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    _favorite = ModalRoute.of(context)!.settings.arguments as List<WordPair>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: ListView.separated(
          itemCount: _favorite.length,
          itemBuilder: (context, index) {
            return _buildRow(context, _favorite[index]);
          },
          separatorBuilder: (context, indext) => const Divider(),
        ),
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
