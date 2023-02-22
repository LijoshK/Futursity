import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:trogonmtest/model/categories.dart';
import 'package:trogonmtest/model/topcourses.dart';

class Api {
  static List? topCourses;
  static List? categories;
  static int a = 0;

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

  static clr() {
    if (a == 1) {
      a = 2;
      return Colors.blue[900];
    } else if (a == 2) {
      a = 3;
      return Colors.red[800];
    } else if (a == 3) {
      a = 1;
      return Colors.green[800];
    }
  }
}
