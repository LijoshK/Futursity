import 'package:flutter/material.dart';
import 'package:trogonmtest/model/categories.dart';
import 'package:trogonmtest/model/services.dart';
import 'package:trogonmtest/model/topcourses.dart';

class Course_pg extends StatefulWidget {
  const Course_pg({Key? key}) : super(key: key);

  @override
  State<Course_pg> createState() => _Course_pgState();
}

class _Course_pgState extends State<Course_pg> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double x = size.height * 2;
    double y = size.width / 2 - 20;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Top Course",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                TextButton(onPressed: () {}, child: Text("All Courses>"))
              ],
            ),
          ),
          Container(
            height: size.height * 0.24,
            width: size.width,
            child: FutureBuilder(
                future: Api.getTopcourses(),
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: Api.topCourses!.length,
                          itemBuilder: (context, index) {
                            TopCourses course = Api.topCourses![index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: x = size.height * 0.2,
                                  width: y = size.width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 2,
                                            blurStyle: BlurStyle.outer,
                                            blurRadius: 8)
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: y,
                                        height: x / 2,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    course.thumbnail))),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                  top: 10,
                                                  child: Text(course.title)),
                                              Positioned(
                                                  right: 1,
                                                  top: 50,
                                                  child: Text(
                                                    "${course.price}",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            );
                          });
                }),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: Api.getCategories(),
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: Api.categories!.length,
                           physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Categories category = Api.categories![index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: x = size.height * 0.2,
                                width: y = size.width * 0.4,
                                decoration: BoxDecoration(
                                    color: index % 3 == 0
                                        ? Colors.blue[900]
                                        : index % 3 == 1
                                            ? Colors.red
                                            : Colors.teal[400],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 8)
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                      height: x / 1.6,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                category.thumbnail,
                                              ))),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                category.name,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Positioned(
                                                left: 2,
                                                top: 45,
                                                child: Text(
                                                    "${category.numberOfCourses} Courses",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ))),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                        );
                }),
          ),
        ],
      ),
    );
  }
}
