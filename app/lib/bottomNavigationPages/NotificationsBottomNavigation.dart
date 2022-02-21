import 'package:app/widgets/app_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NotificationsBottomNavigation extends StatefulWidget {
  const NotificationsBottomNavigation({Key? key}) : super(key: key);

  @override
  State<NotificationsBottomNavigation> createState() =>
      _NotificationsBottomNavigationState();
}

class _NotificationsBottomNavigationState
    extends State<NotificationsBottomNavigation> {
  int activeIndex = 0;
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
        title: const Text("Notifications"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              color: Colors.black,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    height: 180.0,
                    // enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    }),
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = images[index];
                  return buildImage(urlImage, index);
                },

                // body: ListView.builder(
                //   // scrollDirection: Axis.horizontal,
                //   itemCount: 1,
                //   itemBuilder: (_, index) {
                //     return Column(
                //       children: [
                //         const SizedBox(
                //           height: 20.0,
                //         ),
                //         Container(
                //           height: 310.0,
                //           width: double.infinity,
                //           decoration: const BoxDecoration(
                //             color: Colors.blue,
                //             borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //           ),
                //           child: Carousel(
                //             images: [
                //               Image.asset("assets/" + images[0]),
                //               Image.asset("assets/" + images[1]),
                //               Image.asset("assets/" + images[2]),
                //             ],
                //             dotColor: Colors.red,
                //             dotSize: 8.0,
                //             // dotSpacing: 15.0,
                //             dotBgColor: Colors.green,
                //             borderRadius: true,
                //             indicatorBgPadding: 5.0,
                //           ),
                //         )
                //       ],
                //     );
                //   },
                // ),
              ),
            ),
            Positioned(
              left: 170.0,
              top: 155.0,
              child: buildIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Image.asset(
        "assets/" + images[index],
        // fit: BoxFit.cover,
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: images.length,
      effect: const ExpandingDotsEffect(
        activeDotColor: Colors.indigo,
        dotColor: Colors.grey,
        dotWidth: 16.0,
        dotHeight: 16.0,
      ),
    );
  }
}
