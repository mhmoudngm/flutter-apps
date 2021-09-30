import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/screens/screens.dart';
import 'config/palette.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter facebook ui',   
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Palette.scaffold,

      ),
      home: navscreen() ,
    );
  }
}

