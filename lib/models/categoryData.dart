
import 'dart:ui';

import 'package:news_z/generated/assets.dart';
import 'package:news_z/styles/colors.dart';

class CategoryData {
  String id;
  String title;
  String image;
  Color color;

  CategoryData(
      {required this.id,
      required this.title,
      required this.image,
      required this.color});

   static List<CategoryData> getCategories() {
    return [
      CategoryData(
          id: "sports",
          title: " Sports",
          image: Assets.imagesSports,
          color: SPORTS),
      CategoryData(
          id: "business",
          title: " Business",
          image: Assets.imagesBussines,
          color: BUSINESS),
      CategoryData(
          id: "entertainment",
          title: " Entertainment",
          image: Assets.imagesEnvironment,
          color: ENVIROMENT),
      CategoryData(
          id: "health",
          title: " Health",
          image: Assets.imagesHealth,
          color: HEALTH),
      CategoryData(
          id: "science",
          title: " Science",
          image: Assets.imagesScience,
          color: SCIENCE),
      CategoryData(
          id: "Technology",
          title: " Technology",
          image: Assets.imagesSports,
          color: TECHNOLOGY),
      CategoryData(
          id: "general",
          title: "General",
          image: Assets.imagesScience,
          color: GENERAL),
    ];
  }
}
