import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:news_z/screens/category_screen/categories_screen.dart';

import '../../models/categoryData.dart';
import '../category_screen/category_item.dart';

class Drawer_Screen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    var categories=CategoryData.getCategories();
    return Scaffold(
        body: SliderDrawer(
          appBar: SliderAppBar(
              appBarColor: Colors.green,
              title: Text('title',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w700))),
          slider: Container(color: Colors.red),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 7,
                vertical: 7
            ),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: (){

                          },
                          child: CategoryItem(categories[index], index));
                    },),
                )

              ],
            ),
          ),
        ));
  }
}
