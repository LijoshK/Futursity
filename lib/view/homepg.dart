import 'package:flutter/material.dart';
import 'package:trogonmtest/view/course_pg.dart';

class Homepg extends StatefulWidget {
  const Homepg({Key? key}) : super(key: key);

  @override
  State<Homepg> createState() => _HomepgState();
}

class _HomepgState extends State<Homepg> {
  int index=0;
  List<Widget> pages=[
    Course_pg(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.filter_list),
          backgroundColor: Colors.black54),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.school_outlined,
            color: Colors.grey,
          ),
          label: "Course",
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.grey,
            ),
            label: "My Course",),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.grey,
            ),
            label: "Wishlist"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: "Account"),
      ],
      currentIndex: index,
        onTap: (value){
        setState(() {
          index= value;
        });
        },
      ),
      body: SafeArea(
        child: pages[index],
      ),
    );
  }
}
