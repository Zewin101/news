import 'package:flutter/material.dart';
import 'package:news_z/generated/assets.dart';
import 'package:news_z/layout/home_Screen/newsSearch.dart';
import 'package:news_z/models/categoryData.dart';
import 'package:news_z/screens/drawer_screen/drawer_screen.dart';

import '../../screens/category_screen/categories_screen.dart';
import '../../screens/home_screen.dart';

class Home_layout_Screen extends StatefulWidget {
  Home_layout_Screen({Key? key}) : super(key: key);
  static const String routeName = "HomeScreen";

  @override
  State<Home_layout_Screen> createState() => _Home_layout_ScreenState();
}

var searchWord = TextEditingController();

class _Home_layout_ScreenState extends State<Home_layout_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(Assets.imagesPattern),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: NewsSearch());

                },
                icon: ShowIconSearch == false
                    ? Container()
                    : const Icon(Icons.search))
          ],
          backgroundColor: Colors.green,
          shape: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          elevation: 0.0,
          centerTitle: true,
          title: Text("News"),
        ),
        drawer: Drawer_Screen(),
        body: categoryData == null
            ? CategorieScreen(onCategorySelected)
            : HomeScreen(
                categoryData: categoryData,
          searchWord: searchWord.text??"",

              ),
      ),
    );
  }

  CategoryData? categoryData;
  bool ShowIconSearch = false;

  void onCategorySelected(categorySelected) {
    categoryData = categorySelected;
    ShowIconSearch = !ShowIconSearch;

    setState(() {});
  }

}
