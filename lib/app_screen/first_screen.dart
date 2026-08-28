import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(onTap: () {}, leading: Icon(Icons.map), title: Text('Map')),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.photo_album),
            title: Text('Albumn'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
          ListTile(
            // onTap: () {},
            title: Text('This is only text item'),
          ),
          Icon(Icons.favorite),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.photo),
            title: Text('Photo'),
            subtitle: Text('Subtitle text'),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete, color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
