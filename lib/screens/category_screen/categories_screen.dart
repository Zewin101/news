import 'package:flutter/material.dart';
import 'package:news_z/models/categoryData.dart';
import 'package:news_z/screens/category_screen/category_item.dart';

class CategorieScreen extends StatelessWidget {
Function onCategorySelect;

CategorieScreen(this.onCategorySelect);

  static const String routeName="category";
  @override
  Widget build(BuildContext context) {
    var categories=CategoryData.getCategories();
    return Container(
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
                        onCategorySelect(categories[index]);
                      },
                      child: CategoryItem(categories[index], index));
                },),
          )

        ],
      ),
    );
  }
}
