import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class resposive extends StatelessWidget {
  final Widget mobile;
final Widget tablet;
final Widget desktop;

  
  const resposive({  @required this.mobile, this.tablet,@required this.desktop}) ;
  static bool ismobile (BuildContext context) =>MediaQuery.of(context).size.width <800;
  static bool istablet (BuildContext context) =>MediaQuery.of(context).size.width >=800 &&
  MediaQuery.of(context).size.width <1200;

  static bool isdesktop (BuildContext context) =>MediaQuery.of(context).size.width >=1200;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constrains){
        if(constrains.maxWidth >= 1200)
        return desktop;
        else if(constrains.maxWidth >=800)
        return tablet ?? mobile;
        else
        return mobile;
      }
      
    );
  }
}