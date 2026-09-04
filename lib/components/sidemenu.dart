import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Ebiwayo'),
            accountEmail: Text('ebiwayo@ebiwayo.com'),
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(size: 42.0),
              backgroundColor: Colors.white,
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                child: Text("N"),
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange,
              ),
              CircleAvatar(
                child: Icon(Icons.add),
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey,
              ),
            ],
          ),
          ListTile(title: Text('Item 1'), onTap: () {}),
          Divider(),
          ListTile(title: Text('Item 2'), onTap: () {}),
          Divider(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(title: Text('Item 3'), onTap: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
