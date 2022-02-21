import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class BlogFeedBottomNavigation extends StatefulWidget {
  const BlogFeedBottomNavigation({Key? key}) : super(key: key);

  @override
  State<BlogFeedBottomNavigation> createState() =>
      _BlogFeedBottomNavigationState();
}

class _BlogFeedBottomNavigationState extends State<BlogFeedBottomNavigation> {
  List images = [
    "xd.jpg",
    "pervy_sage.jpg",
    "logo.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 70.0,
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: const Text("Blog"),
      ),
      body: Scrollbar(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 410.0,
                    height: 300,
                    // padding: const EdgeInsets.only(
                    //     left: 20.0, right: 20.0, top: 10.0, bottom: 400.0),
                    color: Colors.green,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/" + images[index]),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                        Positioned(
                          top: 270,
                          left: 160,
                          child: Container(
                            // color: Colors.green,
                            // margin: const EdgeInsets.only(
                            //     top: 150, left: 20, right: 20),
                            child: Row(
                              children: List.generate(
                                3,
                                (indexDots) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    width: index == indexDots ? 40 : 10,
                                    height: 10.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: index == indexDots
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
