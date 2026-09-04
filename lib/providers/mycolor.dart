import 'package:flutter/material.dart';
 
class MyColor extends StatefulWidget {
   final Widget child;
   final Color color; // property
  
    const MyColor({
        Key? key,
        required this.color,
        required this.child,
    }) : super(key: key);
  
    static _MyColorState of(BuildContext context) {
        return context.findAncestorStateOfType<_MyColorState>()!; 
    }  
 
    @override
    _MyColorState createState() => _MyColorState();
}
  
class _MyColorState extends State<MyColor> {
    Color color = Colors.green;
 
    @override
    void initState() {
      super.initState();
    }
  
     void setRed(){
         setState(() {
          color = Colors.red;
         });
     }
  
     void setBlue(){
         setState(() {
            color = Colors.blue;
         });
     }
  
     void setColor(_color){
         setState(() {
            color = _color;
         });
     }
  
    @override
    Widget build(BuildContext context) {
        return _MyColor(color: color, child: widget.child);
    }
}
 
// _MyColor เป็น private 
class _MyColor extends InheritedWidget {
    final Color color; // property
  
    // constructor
    const _MyColor({
        Key? key,
        required this.color,
        required Widget child,
    }) : super(child: child); 
  
    @override
    bool updateShouldNotify(data) => true;
  
}