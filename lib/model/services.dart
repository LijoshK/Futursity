import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:trogonmtest/model/categories.dart';
import 'package:trogonmtest/model/topcourses.dart';

class Api {
  static List? topCourses;
  static List? categories;

  static getTopcourses() async {
    Response response =
        await get(Uri.parse("https://futursity.com/course/api/top_courses"));
    if (response.statusCode == 200) {
      topCourses = topCoursesFromJson(response.body);
    }
  }

  static getCategories() async {
    Response response =
        await get(Uri.parse("https://futursity.com/course/api/categories"));
    if (response.statusCode == 200) {
      categories = categoriesFromJson(response.body);
    }
  }

}
