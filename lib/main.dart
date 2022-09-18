import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/Screens/screens.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

// cd D:\flutter_share_screen\platform-tools
// .\scrcpy.exe -m 1920

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter facebook UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
      home: NavScreen(),
    );
  }
}
