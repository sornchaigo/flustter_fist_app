import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  final items = List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
        backgroundColor: Colors.green,
      ),
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text('${items[index]}'), onTap: () {});
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }

  Widget _buildRow(context, index) {
    return Column(
      children: <Widget>[
        ListTile(title: Text('${items[index]}'), onTap: () {}),
        const Divider(),
      ],
    );
  }
}
