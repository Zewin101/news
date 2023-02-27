import 'package:flutter/material.dart';
import 'package:news_z/screens/category_screen/categories_screen.dart';
import 'package:news_z/screens/details_screen/details_screen.dart';
import 'package:news_z/styles/myTheme.dart';

import 'layout/home_Screen/home_layout.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home_layout_Screen.routeName,
      routes: {
        Home_layout_Screen.routeName: (context) => Home_layout_Screen(),
        Details_Screen.routeName:(context) => Details_Screen(),

      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
