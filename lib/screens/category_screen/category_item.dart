import 'package:flutter/material.dart';
import 'package:news_z/models/categoryData.dart';

class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int index;


  CategoryItem(this.categoryData, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryData.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomRight:index.isOdd? Radius.circular(25):Radius.circular(0),
          bottomLeft:index.isEven? Radius.circular(25):Radius.circular(0),
        )

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Image.asset(categoryData.image,
            height: MediaQuery.of(context).size.height*.15,
            width: MediaQuery.of(context).size.height*.50,
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Text(categoryData.title,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.white
                ),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
